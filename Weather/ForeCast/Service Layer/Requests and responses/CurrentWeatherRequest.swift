
//
//  CurrentWeatherRequest.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

struct CurrentWeatherRequest: LocationBaseWeatherRequest {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    let bodyParameters: HTTPDictionary? = nil
    
    var relativePath: String {
        return "/data/2.5/weather"
    }
}
