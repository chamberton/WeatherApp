//
//  WeatherForecastCacheImplementation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/08.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherForecastCacheImplementation: AbstractCache, WeatherForecastCache {
    private var currentWeatherInformation: CurrentWeatherInformation?
    private var lastLocation: CLLocation?
    
    func currentWeatherInformation(for location: CLLocation) -> CurrentWeatherInformation? {
        guard let lastLocation = self.lastLocation else {
            return nil
        }
        guard lastLocation.distance(from: location) < LocationContants.constantWeatherRadiusInMeters else {
            return nil
        }
        return currentWeatherInformation
    }
    
    func update(fetchedObject: Any, timeToLive: TimeInterval) {
        guard let fetchedObject = fetchedObject as? (CurrentWeatherInformation, CLLocation) else {
            return
        }
        expiryDate = Date().addingTimeInterval(timeToLive)
        lastLocation = fetchedObject.1
        currentWeatherInformation =  fetchedObject.0 as CurrentWeatherInformation
    }
}
