//
//  SynchronousHTTPGetClientTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import XCTest
import Result
import Cuckoo
@testable import Weather

class SynchronousHTTPGetClientTests: XCTestCase {
    var implementationUnderTest: SynchronousHTTPGetClientImplementation!
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = SynchronousHTTPGetClientImplementation()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
