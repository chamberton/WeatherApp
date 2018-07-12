
//
//  URLInteractorTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/08.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import Cuckoo
import XCTest
@testable import Weather

class URLManagerTests: XCTestCase {
    var implementationUnderTest: URLInteractor!
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = URLInteractor()
    }
    
    func testThatURLPathsAreNotBuiltForIncorrectValues() {
        var urlPath = implementationUnderTest.urlPathWith(absolute: "t st/", relative: "main")
        XCTAssertTrue(urlPath.isEmpty)
        
        urlPath = implementationUnderTest.urlPathWith(absolute: "t st/", relative: "mai n")
        XCTAssertTrue(urlPath.isEmpty)
        
        urlPath = implementationUnderTest.urlPathWith(absolute: "t; st/", relative: "mai n")
        XCTAssertTrue(urlPath.isEmpty)
    }
    
    func testThatURLPathsAreBuiltForIncorrectValues() {
        var urlPath = implementationUnderTest.urlPathWith(absolute: "test/", relative: "main")
        XCTAssertEqual(urlPath, "test/main")
        urlPath = implementationUnderTest.urlPathWith(absolute: "test/", relative: "main&")
        XCTAssertEqual(urlPath, "test/main&")
    }
    
}
