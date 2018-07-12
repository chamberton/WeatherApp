//
//  URLRequestBuilderTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import XCTest
@testable import Weather

class URLRequestBuilderTests: XCTestCase {
    var implementationUnderTest: URLRequestBuilder!
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = URLRequestBuilder()
    }
    
    func testThatWhenURLStringIsNullTheURLRequestIsNotBuilt() {
        let result = implementationUnderTest.build()
        XCTAssertNil(result)
    }
    
    func testThatTheURLStringIsTheOnlyRequiredParameterToBuildTheRequest() {
        let result = implementationUnderTest.setURLString("www.test.com").build()
        XCTAssertNotNil(result)
    }
    
    func testThatAllParameterAreSetCorrectly() {
        let parameters = ["parameterKey":"paremterValue"]
        let body = ["bodyKey":"bodyValue"]
        let url = "www.test.com"
        _ = implementationUnderTest.setURLString(url).setHTTPMethod("GET").setParameters(parameters).setBody(body)
        XCTAssertEqual(implementationUnderTest.httpMethod,"GET")
        XCTAssertEqual(implementationUnderTest.urlString,"www.test.com")
        XCTAssertEqual(implementationUnderTest.paramaters!.count,1)
        XCTAssertEqual(implementationUnderTest.paramaters!["parameterKey"]?.valueInHTTPRequest, "paremterValue")
        XCTAssertEqual(implementationUnderTest.body!.mapValues({ return $0.valueInHTTPRequest
        }),["bodyKey":"bodyValue"])
    }
    
    func testThatPathParametersAreAddedCorrectlyToThePath() {
        let result_for_one_parameters = implementationUnderTest.setParameters(["key1":"value1"]).setURLString("www.test.com").build()
        let result_for_two_parameters = implementationUnderTest.setParameters(["key1":"value1","key2":"value2"]).setURLString( "www.test.com").build()
        
        XCTAssertEqual(result_for_one_parameters?.url?.absoluteString, "www.test.com?key1=value1")
        XCTAssertEqual(result_for_two_parameters?.url?.absoluteString, "www.test.com?key2=value2&key1=value1")
    }
    
    func testThatPathParametersWithNumberValuesAreAddedCorrectlyToThePath() {
        let result_for_one_parameters = implementationUnderTest.setParameters(["key1":2334]).setURLString("www.test.com").build()
        let result_for_number_parameters = implementationUnderTest.setParameters(["key1": NSNumber(value: 1111)]).setURLString("www.test.com").build()
        let result_for_two_parameters = implementationUnderTest.setParameters(["key1":"value1","key2":1234]).setURLString("www.test.com").build()
        
        XCTAssertEqual(result_for_one_parameters?.url?.absoluteString, "www.test.com?key1=2334")
        XCTAssertEqual(result_for_number_parameters?.url?.absoluteString, "www.test.com?key1=1111")
        XCTAssertEqual(result_for_two_parameters?.url?.absoluteString, "www.test.com?key2=1234&key1=value1")
    }
    
    func testThatWhenBothBodyDataAndBodyAreSetTheRequestIsNull() {
        let resultForRequestWithBodyAndBodyData = implementationUnderTest.setParameters(["key1": "kkk"]).setURLString("www.test.com").setBody(["key" : "String"]).setBodyData("string".data(using: .utf8)!).build()
        
        XCTAssertNil(resultForRequestWithBodyAndBodyData)
    }
    
    func testThatWhenBothBodyIsSetDataAndBodyIsNotSetTheRequestIsNotNull() {
        let resultForRequestWithBodyAndBodyData = implementationUnderTest.setParameters(["key1": "kkk"]).setURLString("www.test.com").setBody(["key": "String"]).build()
        
        XCTAssertNotNil(resultForRequestWithBodyAndBodyData)
    }
    
    func testThatWhenBothBodyDataAndBodyAreNullTheRequestIsNotNil() {
        let resultForRequestWithBodyAndBodyData = implementationUnderTest.setParameters(["key1": "kkk"]).setURLString("www.test.com").build()
        
        XCTAssertNotNil(resultForRequestWithBodyAndBodyData)
    }
    
}
