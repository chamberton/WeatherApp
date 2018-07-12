//
//  WeatherForecastPresenter.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/08.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherForecastPresenter: NSObject, DependencyInjector {
    private lazy var weatherForecastInteractor = injected(WeatherForecastInteractor.self)
    private lazy var locationInteractor = injected(LocationInterator.self)
    public weak var weatherForecastView: WeatherForecastView?
    private var fiveDaysForecast = [(WeatherType, DataStatus)]()
    private var currentWeatherInformation: CurrentWeatherInformation? {
        willSet {
            guard let currentWeatherInformation = newValue else {
                return
            }
            guard let currentWeather = currentWeatherInformation.currentWeather else {
                return
            }
            let weatherType = WeatherType(rawValue: currentWeather.main) ?? .unknown
            self.presentWeatherSummary(currentWeatherInformation: currentWeatherInformation, weatherType: weatherType)
            self.presentWeatherDetails(currentWeatherInformation: currentWeatherInformation,weatherType: weatherType)
        }
    }
    private var isLoadingFiveDaysForecast: Bool = false {
        willSet {
            guard newValue==true else {
                return
            }
            ThreadDispatcher.runOnMain {
                self.willLoadNextFiveDayWeatherForecast()
                self.weatherForecastView?.reloadNextFiveDaysForecastView(weatherType: .unknown)
            }
        }
    }
    private var isLoadingCurrentDayTemperatureInformation: Bool = false {
        willSet {
            guard newValue==true else {
                return
            }
            ThreadDispatcher.runOnMain {
                self.weatherForecastView?.updateSummaryView(weatherType: .unknown, status: .loading)
                self.weatherForecastView?.updateDetailView(weatherType: .unknown, statuses: [.loading,.loading,.loading])
            }
        }
    }
    
    override init() {
        super.init()
        locationInteractor.delegate = self
    }
    
    func findUserLocation() {
        ThreadDispatcher.runOnMain {
            self.locationInteractor.requestLocationAuthorizationIfNeeded()
        }
    }
    
    func loadCurrentWeatherInformation(location: CLLocation? = nil) {
        guard let locationToUse = validatedLocation(location: location) else {
            locationInteractor.requestLocationAuthorizationIfNeeded()
            return
        }
        isLoadingCurrentDayTemperatureInformation = true
        ThreadDispatcher.runInBackground {
            do {
                self.currentWeatherInformation = try self.weatherForecastInteractor.currentWeatherInformation(location: locationToUse)
            } catch HTTPError.offline {
                ThreadDispatcher.runOnMain {
                    self.weatherForecastView?.showCurrentWeatherFailureView()
                    self.weatherForecastView?.showOfflineAlert()
                }
            } catch {
                ThreadDispatcher.runOnMain {
                    self.weatherForecastView?.showCurrentWeatherFailureView()
                }
            }
            self.isLoadingCurrentDayTemperatureInformation = false
        }
    }
    
    func loadNextFiveDaysWeatherForecast(location: CLLocation? = nil) {
        guard let locationToUse = validatedLocation(location: location) else {
            locationInteractor.requestLocationAuthorizationIfNeeded()
            return
        }
        isLoadingFiveDaysForecast = true
        ThreadDispatcher.runInBackground {
            do {
                let forecastByDate = try self.weatherForecastInteractor.nextFiveDaysWeatherForecast(location: locationToUse)
                self.buildfiveDaysForecast(from: forecastByDate)
                ThreadDispatcher.runOnMain {
                    self.weatherForecastView?.reloadNextFiveDaysForecastView(weatherType: .unknown)
                }
            } catch HTTPError.offline {
                ThreadDispatcher.runOnMain {
                    self.weatherForecastView?.showFiveDaysForecastFailureView()
                    self.weatherForecastView?.showOfflineAlert()
                }
            } catch {
                ThreadDispatcher.runOnMain {
                    self.weatherForecastView?.showFiveDaysForecastFailureView()
                }
            }
            self.isLoadingFiveDaysForecast = false
        }
    }
    
    private func buildfiveDaysForecast(from forecastByDates: [WeatherInformationByDate]) {
        var fiveDaysForecast = [(WeatherType, DataStatus)]()
        for forecastByDate in forecastByDates {
            let dataStatus = DataStatus.available(value: forecastByDate.main.temp, description: forecastByDate.dt.dayName.capitalized)
            guard let weather = forecastByDate.weather.first,
                let weatherType =  WeatherType(rawValue: weather.main) else {
                    continue
            }
            fiveDaysForecast.append((weatherType, dataStatus))
        }
        self.fiveDaysForecast = fiveDaysForecast
        ThreadDispatcher.runOnMain {
            self.weatherForecastView?.updatefiveDaysViewBackgroundColor(fiveDaysForecast.last?.0.associatedColor)
        }
    }
    
    private func willLoadNextFiveDayWeatherForecast() {
        fiveDaysForecast.removeAll()
        for _ in 0..<5 {
            fiveDaysForecast.append((.unknown, .loading))
        }
    }
    
    private func presentWeatherSummary(currentWeatherInformation: CurrentWeatherInformation, weatherType: WeatherType){
        let temperature = currentWeatherInformation.main.temp
        let description = weatherDescription(for: currentWeatherInformation.weather.first?.main)
        let status = DataStatus.available(value: temperature, description: description)
        
        ThreadDispatcher.runOnMain {
            self.weatherForecastView?.updateSummaryView(weatherType: weatherType, status: status)
        }
    }
    
    func weatherDescription(for description: String?) -> String {
        guard let description = description else {
            return ""
        }
        if description.compare("Clear")==ComparisonResult.orderedSame {
            return "SUNNY"
        }
        if description.compare("Clouds")==ComparisonResult.orderedSame {
            return "CLOUDY"
        }
        if description.compare("Rain")==ComparisonResult.orderedSame {
            return "RAINY"
        }
        return description.uppercased()
    }
    
    private func presentWeatherDetails(currentWeatherInformation: CurrentWeatherInformation, weatherType: WeatherType){
        var statuses = [DataStatus]()
        statuses.append(DataStatus.available(value: currentWeatherInformation.main.temp_max, description: "max"))
        statuses.append(DataStatus.available(value: currentWeatherInformation.main.temp_min, description: "Current"))
        statuses.append(DataStatus.available(value: currentWeatherInformation.main.temp, description: "min"))
        ThreadDispatcher.runOnMain {
            self.weatherForecastView?.updateDetailView(weatherType: weatherType, statuses: statuses)
        }
    }
    
    private func validatedLocation(location: CLLocation?) -> CLLocation? {
        var optionalLocation: CLLocation?
        if location == nil {
            optionalLocation = locationInteractor.currentLocation
        } else {
            optionalLocation = location
        }
        guard let locationToUse = optionalLocation else {
            locationInteractor.requestLocationAuthorizationIfNeeded()
            return nil
        }
        return locationToUse
    }
}

extension WeatherForecastPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fiveDaysForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:DayWeatherForecastTableViewCell.reuseIdentifier)  as! DayWeatherForecastTableViewCell
        let dayForecast = fiveDaysForecast[indexPath.row]
        cell.updateStatus(dayForecast.1, weatherType: dayForecast.0)
        return cell
    }
}

extension WeatherForecastPresenter: LocationInteractorDelegate {
    func userLocationChanged(location: CLLocation) {
        ThreadDispatcher.runInBackground {
            self.loadCurrentWeatherInformation(location: location)
        }
        ThreadDispatcher.runInBackground {
           self.loadNextFiveDaysWeatherForecast(location: location)
        }
    }
    
    func deviceIsLoadingLocation() {
        isLoadingFiveDaysForecast = true
        isLoadingCurrentDayTemperatureInformation = true
    }
}
