
//
//  FiveDaysForecastCacheImplementation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import CoreLocation

class FiveDaysForecastCacheImplementation: AbstractCache, FiveDaysForecastCache {
    var nextFiveDaysWeatherForecast: [WeatherInformationByDate] = []
    private var lastLocation: CLLocation?
    
    func nextFiveDaysWeatherForecast(for location: CLLocation) -> [WeatherInformationByDate] {
        guard let lastLocation = self.lastLocation  else {
            return []
        }
        guard lastLocation.distance(from: location) < constantWeatherRadiusInMeters else {
            return []
        }
        return nextFiveDaysWeatherForecast
    }
    
    func update(fetchedObject: Any, timeToLive: TimeInterval) {
        guard let fetchedObject = fetchedObject as? ([WeatherInformationByDate], CLLocation) else {
            return
        }
        lastLocation = fetchedObject.1
        expiryDate = Date().addingTimeInterval(timeToLive)
        nextFiveDaysWeatherForecast =  fetchedObject.0 as [WeatherInformationByDate]
    }
}
