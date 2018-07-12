//
//  WeatherForecastInteractor.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherForecastInteractor: DependencyInjector {
    private lazy var weatherForecastService: WeatherForecastService = injected(WeatherForecastService.self)
    private lazy var weatherForecastCache: WeatherForecastCache = injected(WeatherForecastCache.self)
    private lazy var fiveDaysForecastCache: FiveDaysForecastCache = injected(FiveDaysForecastCache.self)
    
    func currentWeatherInformation(location: CLLocation) throws -> CurrentWeatherInformation  {
        if  weatherForecastCache.isValid==true,
            let currentWeatherInformation = weatherForecastCache.currentWeatherInformation(for: location) {
            return currentWeatherInformation
        }
        let currentWeatherRequest = CurrentWeatherRequest(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude)
        let weatherInformationResponse = weatherForecastService.fetchCurrentWeatherInformation(request: currentWeatherRequest)
        
        guard let currentWeatherInformation = weatherInformationResponse.responseObject else {
            if let serviceError = weatherInformationResponse.error {
                throw serviceError
            }else {
                throw HTTPError.failed
            }
        }
        weatherForecastCache.update(fetchedObject: (currentWeatherInformation,location), timeToLive: CacheTimeToLive.weatherForecastCache)
        return currentWeatherInformation
    }
    
    func nextFiveDaysWeatherForecast(location: CLLocation) throws -> [WeatherInformationByDate]  {
        if fiveDaysForecastCache.isValid==true {
            let cachedFiveDaysForecast = fiveDaysForecastCache.nextFiveDaysWeatherForecast(for: location)
            if cachedFiveDaysForecast.isEmpty==false {
                return cachedFiveDaysForecast
            }
        }
        let fiveDayForecastRequest = FiveDayWeatherForecastRequest(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude)
        let fiveDayForecastResponse = weatherForecastService.fetchFiveDayWeatherForecast(request: fiveDayForecastRequest)
        
        guard let fiveDayForecast = fiveDayForecastResponse.responseObject else {
            if let serviceError = fiveDayForecastResponse.error {
                throw serviceError
            } else {
                throw HTTPError.failed
            }
        }
        
        let noonForecastNextFiveDays = fiveDayForecast.noonForecastNextFiveDays
        fiveDaysForecastCache.update(fetchedObject: (noonForecastNextFiveDays, location), timeToLive: CacheTimeToLive.weatherForecastCache)
        return noonForecastNextFiveDays
    }
}
