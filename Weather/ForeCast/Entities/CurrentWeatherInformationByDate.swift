//
//  CurrentWeatherInformationByDate.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/11.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Foundation

struct WeatherInformationByDate: Codable, Equatable {
    var dt: Date
    var weather: [WeatherDescription]
    var main: WeatherInformation
}
