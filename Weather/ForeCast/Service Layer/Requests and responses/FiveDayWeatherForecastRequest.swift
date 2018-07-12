
//
//  FiveDayWeatherForecastRequest.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

struct FiveDayWeatherForecastRequest: LocationBaseWeatherRequest {
    let bodyParameters: HTTPDictionary? = nil
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var relativePath: String {
        return "/data/2.5/forecast"
    }
}
