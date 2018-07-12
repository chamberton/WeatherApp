//
//  CurrentWeatherResponse.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

struct CurrentWeatherResponse: HTTPResponse {
    typealias T = CurrentWeatherInformation
    var responseObject: CurrentWeatherInformation?
    var error: HTTPError?
}
