
//
//  WeatherForecastInteractorTests.swift
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

class WeatherForecastInteractorTests: XCTestCase {
    var implementationUnderTest: WeatherForecastInteractor!
    var mockedWeatherForecastService: MockWeatherForecastService!
    var mockedWeatherForecastCache: MockWeatherForecastCache!
    var mockedFiveDaysForecastCache: MockFiveDaysForecastCache!
    
    override func setUp() {
        super.setUp()
        mockedWeatherForecastCache = MockWeatherForecastCache()
        mockedFiveDaysForecastCache = MockFiveDaysForecastCache()
        mockedWeatherForecastService = MockWeatherForecastService().withEnabledSuperclassSpy()
        DependencyManager.register({ self.mockedWeatherForecastService }, for: WeatherForecastService.self)
        DependencyManager.registerSingleInstance({ self.mockedWeatherForecastCache }, for: WeatherForecastCache.self)
        DependencyManager.registerSingleInstance({ self.mockedFiveDaysForecastCache }, for: FiveDaysForecastCache.self)
        implementationUnderTest = WeatherForecastInteractor()
        
        stub(mockedWeatherForecastCache) { (mock) in
            when(mock).clear().thenDoNothing()
            when(mock).invalidate().thenDoNothing()
            when(mock).isValid.get.thenReturn(false)
            when(mock).currentWeatherInformation(for: any()).thenReturn(nil)
            when(mock).update(fetchedObject: any(), timeToLive: any()).thenDoNothing()
        }
        stub(mockedFiveDaysForecastCache) { (mock) in
            when(mock).clear().thenDoNothing()
            when(mock).invalidate().thenDoNothing()
            when(mock).isValid.get.thenReturn(false)
            when(mock).nextFiveDaysWeatherForecast(for: any()).thenReturn([WeatherInformationByDate]())
            when(mock).update(fetchedObject: any(), timeToLive: any()).thenDoNothing()
        }
    }
    
    // MARK: - Tests for currentWeatherInformation
    
    func testThatWhenCacheIsNotValidServiceCallIsPerformed() {
        mockedWeatherForecastCache.invalidate()
        _ = try? implementationUnderTest.currentWeatherInformation(location: CLLocation())
        verify(mockedWeatherForecastService).fetchCurrentWeatherInformation(request: any())
    }
    
    func testThatWhenCacheIsEmptyServiceCallIsPerformed() {
        stub(mockedWeatherForecastCache) { mock in
            when(mock).currentWeatherInformation(for: any()).thenReturn(nil)
        }
        _ = try? implementationUnderTest.currentWeatherInformation(location: CLLocation())
        verify(mockedWeatherForecastService).fetchCurrentWeatherInformation(request: any())
    }
    
    func testThatWhenCurrentWeatherInformationIsFetchedFromServiceThenTheCacheIsUpdated() {
        stub(mockedWeatherForecastCache) { mock in
            when(mock).currentWeatherInformation(for: any()).thenReturn(nil)
        }
        let returnedCurrentWeatherResponse = CurrentWeatherResponse(responseObject: TestDataGenerator.dummyCurrentWeatherInformation, error: nil)
        stub(mockedWeatherForecastService) { mock in
            when(mock).fetchCurrentWeatherInformation(request: any()).thenReturn(returnedCurrentWeatherResponse)
        }
        let returnedCurrentWeatherInformation = try? implementationUnderTest.currentWeatherInformation(location: CLLocation())
        verify(mockedWeatherForecastService).fetchCurrentWeatherInformation(request: any())
        verify(mockedWeatherForecastCache).update(fetchedObject: any(), timeToLive: any())
        XCTAssertNotNil(returnedCurrentWeatherInformation)
        XCTAssertEqual(returnedCurrentWeatherInformation, TestDataGenerator.dummyCurrentWeatherInformation)
    }
    
    func testThatWhenCurrentWeatherInformationIsNotFetchedFromServiceThenAnErrorIsThrown() {
        stub(mockedWeatherForecastCache) { mock in
            when(mock).currentWeatherInformation(for: any()).thenReturn(nil)
        }
        let returnedCurrentWeatherResponse = CurrentWeatherResponse(responseObject: nil, error: nil)
        stub(mockedWeatherForecastService) { mock in
            when(mock).fetchCurrentWeatherInformation(request: any()).thenReturn(returnedCurrentWeatherResponse)
        }
        XCTAssertThrowsError(try implementationUnderTest.currentWeatherInformation(location: CLLocation())){
            errorHandler in
            XCTAssertEqual(errorHandler as! HTTPError, HTTPError.failed)
        }
        verify(mockedWeatherForecastCache, never()).update(fetchedObject: any(), timeToLive: any())
    }
    
    func testThatWhenAnErrorOccursWhileFetchingCurrentWeatherInformationFromServiceThenAnErrorIsThrown() {
        stub(mockedWeatherForecastCache) { mock in
            when(mock).currentWeatherInformation(for: any()).thenReturn(nil)
        }
        let returnedCurrentWeatherResponse = CurrentWeatherResponse(responseObject: nil, error: HTTPError.offline)
        stub(mockedWeatherForecastService) { mock in
            when(mock).fetchCurrentWeatherInformation(request: any()).thenReturn(returnedCurrentWeatherResponse)
        }
        XCTAssertThrowsError(try implementationUnderTest.currentWeatherInformation(location: CLLocation())) {
            errorHandler in
            XCTAssertEqual(errorHandler as! HTTPError, HTTPError.offline)
        }
        verify(mockedWeatherForecastCache, never()).update(fetchedObject: any(), timeToLive: any())
    }
    
    func testThatWhenThereIsValidDataInTheCacheThenItIsUsedNoServiceCallIsPerformed() {
        stub(mockedWeatherForecastCache) { mock in
            when(mock).currentWeatherInformation(for: any()).thenReturn(TestDataGenerator.dummyCurrentWeatherInformation)
            when(mock).isValid.get.thenReturn(true)
        }
        let returnedCurrentWeatherInformation = try? implementationUnderTest.currentWeatherInformation(location: CLLocation())
        verify(mockedWeatherForecastService, never()).fetchCurrentWeatherInformation(request: any())
        verify(mockedWeatherForecastCache, never()).update(fetchedObject: any(), timeToLive: any())
        XCTAssertNotNil(returnedCurrentWeatherInformation)
        XCTAssertEqual(returnedCurrentWeatherInformation, TestDataGenerator.dummyCurrentWeatherInformation)
    }
    
    // MARK: - Tests for nextFiveDaysWeatherForecast
    
    func testThatWhenFiveDayForecastCacheIsNotValidServiceCallIsPerformed() {
        mockedFiveDaysForecastCache.invalidate()
        _ = try? implementationUnderTest.nextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedWeatherForecastService).fetchFiveDayWeatherForecast(request: any())
    }
    
    func testThatWhenFiveDayForecastCacheIsEmptyServiceCallIsPerformed() {
        stub(mockedFiveDaysForecastCache) { mock in
            when(mock).nextFiveDaysWeatherForecast(for: any()).thenReturn([WeatherInformationByDate]())
        }
        _ = try? implementationUnderTest.nextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedWeatherForecastService).fetchFiveDayWeatherForecast(request: any())
    }
    
    func testThatWhenFiveDaysWeatherForecastIsFetchedFromServiceThenTheCacheIsUpdated() {
        stub(mockedFiveDaysForecastCache) { mock in
            when(mock).nextFiveDaysWeatherForecast(for: any()).thenReturn([WeatherInformationByDate]())
        }
        let returnedFiveDayForecastResponse = FiveDayWeatherForecastResponse(responseObject: TestDataGenerator.fiveDayWeatherForecast, error: nil)
        stub(mockedWeatherForecastService) { mock in
            when(mock).fetchFiveDayWeatherForecast(request: any()).thenReturn(returnedFiveDayForecastResponse)
        }
        let returnedFiveDayForecastInformation = try? implementationUnderTest.nextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedWeatherForecastService).fetchFiveDayWeatherForecast(request: any())
        verify(mockedFiveDaysForecastCache).update(fetchedObject: any(), timeToLive: any())
        XCTAssertNotNil(returnedFiveDayForecastInformation)
        XCTAssertEqual(returnedFiveDayForecastInformation,TestDataGenerator.fiveDayWeatherForecast.noonForecastNextFiveDays)
    }
    
    func testThatWhenFiveDayWeatherForcastIsNotFetchedFromServiceThenAnErrorIsThrown() {
        stub(mockedFiveDaysForecastCache) { mock in
            when(mock).nextFiveDaysWeatherForecast(for: any()).thenReturn([WeatherInformationByDate]())
        }
        let returnedFiveDayForecastResponse = FiveDayWeatherForecastResponse(responseObject: nil, error: nil)
        stub(mockedWeatherForecastService) { mock in
            when(mock).fetchFiveDayWeatherForecast(request: any()).thenReturn(returnedFiveDayForecastResponse)
        }
        XCTAssertThrowsError(try implementationUnderTest.nextFiveDaysWeatherForecast(location: CLLocation())){
            errorHandler in
            XCTAssertEqual(errorHandler as! HTTPError, HTTPError.failed)
        }
        verify(mockedFiveDaysForecastCache, never()).update(fetchedObject: any(), timeToLive: any())
    }
    
    func testThatWhenAnErrorOccursWhileFetchingNextFiveDayForecastFromServiceThenAnErrorIsThrown() {
        stub(mockedFiveDaysForecastCache) { mock in
            when(mock).nextFiveDaysWeatherForecast(for: any()).thenReturn([])
        }
        let returnedFiveDayForecastResponse = FiveDayWeatherForecastResponse(responseObject: nil, error: HTTPError.offline)
        stub(mockedWeatherForecastService) { mock in
            when(mock).fetchFiveDayWeatherForecast(request: any()).thenReturn(returnedFiveDayForecastResponse)
        }
        XCTAssertThrowsError(try implementationUnderTest.nextFiveDaysWeatherForecast(location: CLLocation())) {
            errorHandler in
            XCTAssertEqual(errorHandler as! HTTPError, HTTPError.offline)
        }
        verify(mockedFiveDaysForecastCache, never()).update(fetchedObject: any(), timeToLive: any())
    }
    
    func testThatWhenThereIsValidDataInTheNextFiveDayForecastCacheThenItIsUsedNoServiceCallIsPerformed() {
        stub(mockedFiveDaysForecastCache) { mock in
            when(mock).nextFiveDaysWeatherForecast(for: any()).thenReturn(TestDataGenerator.fiveDayWeatherForecast.list)
            when(mock).isValid.get.thenReturn(true)
        }
        
        let returnedFiveDayForecastResponse = try? implementationUnderTest.nextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedWeatherForecastService, never()).fetchFiveDayWeatherForecast(request: any())
        verify(mockedFiveDaysForecastCache, never()).update(fetchedObject: any(), timeToLive: any())
        XCTAssertNotNil(returnedFiveDayForecastResponse)
    XCTAssertEqual(returnedFiveDayForecastResponse,TestDataGenerator.fiveDayWeatherForecast.noonForecastNextFiveDays)
    }
}
