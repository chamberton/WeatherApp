//
//  FiveDaysForecastCacheTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import XCTest
import Result
import Cuckoo
import CoreLocation
@testable import Weather

class FiveDaysForecastCacheTests: XCTestCase {
    var implementationUnderTest: FiveDaysForecastCacheImplementation!
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = FiveDaysForecastCacheImplementation()
    }
    
    func testThatWhenLastLocationIsNullThenTheCurrenLocationWeatherInformationIsNull() {
        XCTAssertTrue(implementationUnderTest.nextFiveDaysWeatherForecast(for: CLLocation()).isEmpty)
    }
    
    func testThatWhenLastLocationDistanceFromCurrentIsAboveTheThresholdThenCurrentInformationIsValid() {
        let weatherByDate = WeatherInformationByDate(dt: Date().addingTimeInterval(3600*24), weather: [TestDataGenerator.dummyWeather], main: TestDataGenerator.dummyWeatherInformation)
        implementationUnderTest.update(fetchedObject: ([weatherByDate],CLLocation(latitude: 20, longitude: 20)),timeToLive: 24*3600)
        XCTAssertTrue(implementationUnderTest.nextFiveDaysWeatherForecast(for: CLLocation()).isEmpty)
    }
    
    func testThatWhenLastLocationDistanceFromCurrentIsBelowTheThresholdThenCurrentInformationIsValid() {
         let weatherByDate = WeatherInformationByDate(dt: Date().addingTimeInterval(3600*24), weather: [TestDataGenerator.dummyWeather], main: TestDataGenerator.dummyWeatherInformation)
        implementationUnderTest.update(fetchedObject: ([weatherByDate],CLLocation()),timeToLive: 24*3600)
        XCTAssertFalse(implementationUnderTest.nextFiveDaysWeatherForecast(for: CLLocation()).isEmpty)
    }
    
    func testThatWhenUpdateWithWrongDataTheCacheIsEmpty() {
        implementationUnderTest.update(fetchedObject: "asddf", timeToLive: 24*3600 )
        XCTAssertTrue(implementationUnderTest.nextFiveDaysWeatherForecast(for: CLLocation()).isEmpty)
    }
}
