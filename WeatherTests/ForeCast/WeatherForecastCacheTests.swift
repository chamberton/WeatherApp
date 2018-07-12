//
//  WeatherForecastCacheTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import XCTest
import Result
import Cuckoo
import CoreLocation
@testable import Weather

class WeatherForecastCacheTests: XCTestCase {
    var implementationUnderTest: WeatherForecastCacheImplementation!
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = WeatherForecastCacheImplementation()
    }
    
    func testThatWhenLastLocationIsNullThenTheCurrenLocationWeatherInformationIsNull() {
        XCTAssertNil(implementationUnderTest.currentWeatherInformation(for: CLLocation()))
    }
    
    func testThatWhenLastLocationDistanceFromCurrentIsAboveTheThresholdThenCurrentInformationIsValid() {
        implementationUnderTest.update(fetchedObject: (CurrentWeatherInformation(weather: [], main: TestDataGenerator.dummyWeatherInformation) , CLLocation(latitude: 20, longitude: 20)), timeToLive: 24*3600 )
        XCTAssertNil(implementationUnderTest.currentWeatherInformation(for: CLLocation()))
    }
    
    func testThatWhenLastLocationDistanceFromCurrentIsBelowTheThresholdThenCurrentInformationIsValid() {
        implementationUnderTest.update(fetchedObject: (CurrentWeatherInformation(weather: [], main: TestDataGenerator.dummyWeatherInformation) , CLLocation()), timeToLive: 24*3600 )
        XCTAssertNotNil(implementationUnderTest.currentWeatherInformation(for: CLLocation()))
    }
    
    func testThatWhenUpdateWithWrongDataTheCacheIsNull() {
        implementationUnderTest.update(fetchedObject: "asddf", timeToLive: 24*3600 )
        XCTAssertNil(implementationUnderTest.currentWeatherInformation(for: CLLocation()))
    }
}
