//
//  FiveDayWeatherForecastResponse.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

struct FiveDayWeatherForecastResponse: HTTPResponse {
    typealias T = FiveDayWeatherForecast
    var responseObject: FiveDayWeatherForecast?
    var error: HTTPError?
}
