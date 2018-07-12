//
//  FiveDayWeatherForecastRequestTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import XCTest
@testable import Weather

class FiveDayWeatherForecastRequestTests: XCTestCase {
    var implementationUnderTest: FiveDayWeatherForecastRequest!
    private let longitude = 20.00
    private let latitude = 20.00
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = FiveDayWeatherForecastRequest(latitude: latitude, longitude: longitude)
    }
    
    func testThatTheCorrectRelativePathIsReturned() {
        XCTAssertEqual(implementationUnderTest.relativePath, "/data/2.5/forecast")
    }
}
