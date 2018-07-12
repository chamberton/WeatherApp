
//
//  WeatherInformation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

struct WeatherInformation: Codable, Equatable {
    var temp: Double
    var pressure: Double
    var humidity: Int
    var temp_min: Double
    var temp_max: Double
}
