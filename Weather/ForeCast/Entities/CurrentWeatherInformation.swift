
//
//  CurrentWeatherInformation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

struct CurrentWeatherInformation: Codable, Equatable {
    var weather: [WeatherDescription]
    var main: WeatherInformation
    var currentWeather: WeatherDescription? {
        return weather.first
    }
}
