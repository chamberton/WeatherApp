
//
//  CurrentWeatherRequestTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import XCTest
import Result
import Cuckoo
@testable import Weather

class CurrentWeatherRequestTests: XCTestCase {
    var implementationUnderTest: CurrentWeatherRequest!
    private let longitude = 20.00
    private let latitude = 20.00
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = CurrentWeatherRequest(latitude: latitude, longitude: longitude)
    }
    
    func testThatTheCorrectRelativePathIsReturned() {
        XCTAssertEqual(implementationUnderTest.relativePath, "/data/2.5/weather")
    }
}
