
//
//  FiveDayForecast.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Foundation

struct FiveDayWeatherForecast: Codable, Equatable {
    var list: [WeatherInformationByDate]
    let secondsInADay = Double(24*2600)
    
    public func noonForecast(numberOfDaysAfter days: Int) -> WeatherInformationByDate? {
        let today = Date()
        let filteredWeatherInformationsByDate = list.filter {
            let secondsFromToday = $0.dt.timeIntervalSince(today)
            return $0.dt > today && secondsFromToday>secondsInADay*Double(days-1) && secondsFromToday<24*3600*Double(days)
        }
        let weatherInformationForNoon = filteredWeatherInformationsByDate.filter {
            return Calendar.current.component(.hour, from: $0.dt) == 12
        }
        return weatherInformationForNoon.first ?? filteredWeatherInformationsByDate.first
    }
    
    public var noonForecastNextFiveDays: [WeatherInformationByDate] {
        var noonForecastNextFiveDays = [WeatherInformationByDate]()
        for i in 1...5 {
            if let forecast = noonForecast(numberOfDaysAfter: i) {
                noonForecastNextFiveDays.append(forecast)
            }
        }
        return noonForecastNextFiveDays
    }
}
