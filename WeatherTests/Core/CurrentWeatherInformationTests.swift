
//
//  CurrentWeatherInformationTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import XCTest
@testable import Weather

class CurrentWeatherInformationTests: XCTestCase {
    var implementationUnderTest: CurrentWeatherInformation!
   
    func testThatWhenWeatherDoesNotContainAnyValueCurrentWeatherIsNull() {
        implementationUnderTest = CurrentWeatherInformation(weather: [], main: TestDataGenerator.dummyWeatherInformation)
        XCTAssertNil(implementationUnderTest.currentWeather)
    }
    
    func testThatWhenWeatherDoesContainsValuesCurrentWeatherIsTheFirstElement() {
        implementationUnderTest = CurrentWeatherInformation(weather: [TestDataGenerator.dummyWeather], main: TestDataGenerator.dummyWeatherInformation)
        XCTAssertEqual(TestDataGenerator.dummyWeather, implementationUnderTest.currentWeather)
    }
}
