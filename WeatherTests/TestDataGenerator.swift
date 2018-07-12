
//
//  TestDataGenerator.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Foundation
import XCTest
@testable import Weather

class TestDataGenerator: XCTestCase {
    public static var dummyWeatherInformation: WeatherInformation {
        return WeatherInformation(temp: 39.26, pressure: 960.97, humidity: 13, temp_min: 39.26, temp_max: 39.26)
    }
    public static var dummyWeather: WeatherDescription {
        return WeatherDescription(main: "Clear", description: "clear sky")
    }
    public static var randomError =  NSError(domain: "testDomain", code: 1000002, userInfo: [:])
   
    public static var dummyCurrentWeatherInformation: CurrentWeatherInformation {
        return CurrentWeatherInformation(weather: [dummyWeather], main: dummyWeatherInformation)
    }
    private static var todayDate = Date()
    static var todayAdvancedBy12Hours: Date {
       return todayDate.addingTimeInterval(12*3600)
    }
    
    public static var fiveDayWeatherForecast: FiveDayWeatherForecast {
        return FiveDayWeatherForecast(list: [WeatherInformationByDate(dt:todayAdvancedBy12Hours, weather: [dummyWeather], main: dummyWeatherInformation)])
    }
    
    public static var dummyCurrentWeatherInformationData: Data {
        if let path = Bundle(for: TestDataGenerator.self).path(forResource: "CurrentWeatherInformationSample", ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                XCTFail("Unexpected error thrown")
            }
        } else {
            XCTFail("Unexpected error thrown")
        }
        fatalError("Failed to find json file")
    }
    
    public static var dummyFiveDayWeatherForecastData: Data {
        if let path = Bundle(for: TestDataGenerator.self).path(forResource: "FiveDayWeatherForecastSample", ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                XCTFail("Unexpected error thrown")
            }
        } else {
            XCTFail("Unexpected error thrown")
        }
        fatalError("Failed to find json file")
    }
}
