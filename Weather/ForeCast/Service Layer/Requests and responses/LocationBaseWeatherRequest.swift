
//
//  LocationBaseWeatherRequest.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol LocationBaseWeatherRequest: HTTPRequest {
    var pathParameters: HTTPDictionary? { get }
    var latitude: Double { get }
    var longitude: Double { get }
}

extension LocationBaseWeatherRequest {
    var pathParameters: HTTPDictionary? {
        return ["lat": latitude, "lon": longitude, "units": "metric"]
    }
    var headers: HTTPDictionary {
        return ["x-api-key": headerInjector.weatherApiKey]
    }
}
