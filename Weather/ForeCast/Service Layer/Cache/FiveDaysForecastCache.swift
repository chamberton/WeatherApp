
//
//  FiveDaysForecastCache.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import CoreLocation

protocol FiveDaysForecastCache: Cache {
    func nextFiveDaysWeatherForecast(for location: CLLocation) -> [WeatherInformationByDate]
}
