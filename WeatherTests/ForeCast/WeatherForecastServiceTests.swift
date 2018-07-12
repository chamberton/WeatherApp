//
//  WeatherForecastServiceTests.swift
//  WeatherTests
//
//  Created by Serge Mbamba on 2018/07/09.
//  Copyright © 2018 Momentum. All rights reserved.
//

import XCTest
import Result
import Cuckoo
@testable import Weather

class WeatherForecastServiceTests: XCTestCase {
    var implementationUnderTest: WeatherForecastService!
    var mockedHTTPSynchGetClient: MockSynchronousHTTPGetClient!
    var mockedURLInteractor: MockURLInteractor!
    
    override func setUp() {
        super.setUp()
        mockedHTTPSynchGetClient = MockSynchronousHTTPGetClient()
        mockedURLInteractor = MockURLInteractor().withEnabledSuperclassSpy()
        DependencyManager.register({ self.mockedHTTPSynchGetClient }, for: SynchronousHTTPGetClient.self)
        DependencyManager.registerSingleInstance({ self.mockedURLInteractor }, for: URLInteractor.self)
        implementationUnderTest = WeatherForecastService()
    }
    
    // MARK: - Tests for Retrieval of CurrentWeatherInformation
    
    func testThatWhenCurrentWeatherHTTPCallFailsThenTheServiceResponseContainsAnError() {
        stub(mockedHTTPSynchGetClient){ mock in
            when(mock).get(from: any(), paremeters: any(), headers: any()).thenReturn(.failure(HTTPError.offline))
        }
        let currentWeatherRequest = CurrentWeatherRequest(latitude: 20.00, longitude: 20.00)
        let serviceResponse = implementationUnderTest.fetchCurrentWeatherInformation(request: currentWeatherRequest)
        guard let error = serviceResponse.error else {
            XCTFail("Should have returned an error")
            return
        }
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .offline)
    }
    
    func testThatWhenThereAreNoInformationInCurrentWeatherHTTPResponseThenTheServiceResponseContainsAnError() {
        stub(mockedHTTPSynchGetClient){ mock in
            when(mock).get(from: any(), paremeters: any(), headers: any()).thenReturn(.success(Data()))
        }
        let currentWeatherRequest = CurrentWeatherRequest(latitude: 20.00, longitude: 20.00)
        let serviceResponse = implementationUnderTest.fetchCurrentWeatherInformation(request: currentWeatherRequest)
       
        guard let error = serviceResponse.error else {
            XCTFail("Should have returned an error")
            return
        }
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .notFound)
    }
    
    func testThatWhenAValidWeatherInformationInCurrentWeatherHTTPResponseThenItIsReturnedByTheServie() {
        stub(mockedHTTPSynchGetClient){ mock in
            when(mock).get(from: any(), paremeters: any(), headers: any()).thenReturn(.success(TestDataGenerator.dummyCurrentWeatherInformationData))
        }
        let currentWeatherRequest = CurrentWeatherRequest(latitude: 20.00, longitude: 20.00)
        let serviceResponse = implementationUnderTest.fetchCurrentWeatherInformation(request: currentWeatherRequest)
        
        XCTAssertNil(serviceResponse.error)
        guard let currentWeatherInformation = serviceResponse.responseObject else {
            XCTFail("Should returned valid object")
            return
        }
        XCTAssertEqual(currentWeatherInformation, TestDataGenerator.dummyCurrentWeatherInformation)
    }
    
     // MARK: - Tests For Retrieval of Five Day Weather Forecast
    
    func testThatWhenTheFiveDayForecastHTTPCallFailsThenTheServiceResponseContainsAnError() {
        stub(mockedHTTPSynchGetClient){ mock in
            when(mock).get(from: any(), paremeters: any(), headers: any()).thenReturn(.failure(HTTPError.offline))
        }
        let fiveDayForecastRequest = FiveDayWeatherForecastRequest(latitude: 20.00, longitude: 20.00)
        let serviceResponse = implementationUnderTest.fetchFiveDayWeatherForecast(request: fiveDayForecastRequest)
        guard let error = serviceResponse.error else {
            XCTFail("Should have returned an error")
            return
        }
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .offline)
    }
    
    
    func testThatWhenThereAreNoInformationInFiveDayForecastHTTPResponseThenTheServiceResponseContainsAnError() {
        stub(mockedHTTPSynchGetClient){ mock in
            when(mock).get(from: any(), paremeters: any(), headers: any()).thenReturn(.success(Data()))
        }
        let fiveDayForecastRequest = FiveDayWeatherForecastRequest(latitude: 20.00, longitude: 20.00)
        let serviceResponse = implementationUnderTest.fetchFiveDayWeatherForecast(request: fiveDayForecastRequest)
        
        guard let error = serviceResponse.error else {
            XCTFail("Should have returned an error")
            return
        }
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .notFound)
    }
    
    func testThatWhenAValidWeatherInformationInFiveDayForecastHTTPResponseThenItIsReturnedByTheServie() {
        stub(mockedHTTPSynchGetClient){ mock in
            when(mock).get(from: any(), paremeters: any(), headers: any()).thenReturn(.success(TestDataGenerator.dummyFiveDayWeatherForecastData))
        }
        let fiveDayForecastRequest = FiveDayWeatherForecastRequest(latitude: 20.00, longitude: 20.00)
        let serviceResponse = implementationUnderTest.fetchFiveDayWeatherForecast(request: fiveDayForecastRequest)
        
        XCTAssertNil(serviceResponse.error)
        guard let fiveDayWeatherForecast = serviceResponse.responseObject else {
            XCTFail("Should returned valid object")
            return
        }
        XCTAssertTrue(fiveDayWeatherForecast.list.count>5)
    }
}
