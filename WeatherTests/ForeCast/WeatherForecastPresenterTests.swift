
//
//  WeatherForecastPresenterTests.swift
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

class WeatherForecastPresenterTests: XCTestCase {
    var implementationUnderTest: WeatherForecastPresenter!
    var mockedWeatherForecastView: MockWeatherForecastView!
    var mockedLocationInterator: MockLocationInterator!
    var mockedWeatherForecastInteractor: MockWeatherForecastInteractor!
    
    override func setUp() {
        super.setUp()
        mockedLocationInterator = MockLocationInterator().withEnabledSuperclassSpy()
        mockedWeatherForecastInteractor = MockWeatherForecastInteractor().withEnabledSuperclassSpy()
        DependencyManager.registerSingleInstance({ self.mockedLocationInterator }, for: LocationInterator.self)
        DependencyManager.register({ self.mockedWeatherForecastInteractor }, for: WeatherForecastInteractor.self)
        implementationUnderTest = WeatherForecastPresenter()
        mockedWeatherForecastView = MockWeatherForecastView()
        implementationUnderTest.weatherForecastView = mockedWeatherForecastView
        stub(mockedLocationInterator) { mock in
            when(mock).requestLocationAuthorizationIfNeeded().thenDoNothing()
        }
        stub(mockedWeatherForecastView) { mock in
            when(mock).showCurrentWeatherFailureView().thenDoNothing()
            when(mock).reloadNextFiveDaysForecastView(weatherType: any()).thenDoNothing()
            when(mock).showFiveDaysForecastFailureView().thenDoNothing()
            when(mock).showOfflineAlert().thenDoNothing()
            when(mock).updatefiveDaysViewBackgroundColor(any()).thenDoNothing()
            when(mock).updateSummaryView(weatherType: any(), status: any()).thenDoNothing()
            when(mock).updatefiveDaysViewBackgroundColor(any()).thenDoNothing()
            when(mock).updateDetailView(weatherType: any(), statuses: any()).thenDoNothing()
        }
    }
    
    func testThatWhenRequestedToFindUserLocationTheCommandIsPassedtoTheLocationInteractor() {
        implementationUnderTest.findUserLocation()
        verify(mockedLocationInterator).requestLocationAuthorizationIfNeeded()
    }
    
    // MARK: - Tests for loadCurrentWeatherInformation
    
    func testThatWhenCurrentLocationIsNotProvidedThenTheLocationManagerIsAskedForLocation() {
        clearInvocations(mockedLocationInterator)
        implementationUnderTest.loadCurrentWeatherInformation()
        verify(mockedLocationInterator).currentLocation.get()
        verify(mockedLocationInterator, times(2)).requestLocationAuthorizationIfNeeded()
    }
    
    func testThatWhenCurrentLocationIsProvidedThenTheLocationManagerIsNotForLocation() {
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).currentWeatherInformation(location: any()).thenThrow(HTTPError.offline)
        }
        implementationUnderTest.loadCurrentWeatherInformation(location: CLLocation())
        verify(mockedLocationInterator, never()).currentLocation.get()
        verify(mockedLocationInterator, never()).requestLocationAuthorizationIfNeeded()
    }
    
    func testThatWhenTheDeviceIsOfflineTheViewNotifies() {
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).currentWeatherInformation(location: any()).thenThrow(HTTPError.offline)
        }
        implementationUnderTest.loadCurrentWeatherInformation(location: CLLocation())
        verify(mockedWeatherForecastView).updateDetailView(weatherType: any(), statuses: any())
        verify(mockedWeatherForecastView).updateSummaryView(weatherType: any(), status: any())
        verify(mockedWeatherForecastView).showOfflineAlert()
        verify(mockedWeatherForecastView).showCurrentWeatherFailureView()
    }
    
    func testThatWhenAnUnknownErrorOccursWhenFetchingCurrentWeatherInformationTheViewShowsAnErrorMessage() {
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).currentWeatherInformation(location: any()).thenThrow(TestDataGenerator.randomError)
        }
        implementationUnderTest.loadCurrentWeatherInformation(location: CLLocation())
        verify(mockedWeatherForecastView).updateDetailView(weatherType: any(), statuses: any())
        verify(mockedWeatherForecastView).updateSummaryView(weatherType: any(), status: any())
        verify(mockedWeatherForecastView, never()).showOfflineAlert()
        verify(mockedWeatherForecastView).showCurrentWeatherFailureView()
    }
    
    func testThatWhenFetchingOfCurrentWeatherSucceedsThenTheViewUpdateAppropriateSection() {
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).currentWeatherInformation(location: any()).thenReturn(TestDataGenerator.dummyCurrentWeatherInformation)
        }
        implementationUnderTest.loadCurrentWeatherInformation(location: CLLocation())
        verify(mockedWeatherForecastView,times(2)).updateDetailView(weatherType: any(), statuses: any())
        verify(mockedWeatherForecastView,times(2)).updateSummaryView(weatherType: any(), status: any())
        verify(mockedWeatherForecastView, never()).showOfflineAlert()
        verify(mockedWeatherForecastView, never()).showCurrentWeatherFailureView()
    }
    
    // MARK: - Tests for loadNextFiveDaysWeatherForecast
    
    func testThatWhenCurrentLocationIsNotProvidedThenTheLocationManagerIsAskedForLocationWhileLoadingFiveDaysForecast() {
        clearInvocations(mockedLocationInterator)
        implementationUnderTest.loadNextFiveDaysWeatherForecast()
        verify(mockedLocationInterator).currentLocation.get()
        verify(mockedLocationInterator, times(2)).requestLocationAuthorizationIfNeeded()
    }
    
    func testThatWhenCurrentLocationIsProvidedBeforeLoadingFiveDaysForecastThenTheLocationManagerIsNotForLocation() {
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).nextFiveDaysWeatherForecast(location: any()).thenThrow(HTTPError.offline)
        }
        implementationUnderTest.loadNextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedLocationInterator, never()).currentLocation.get()
        verify(mockedLocationInterator, never()).requestLocationAuthorizationIfNeeded()
    }
    
    func testThatWhenTheDeviceIsOfflineWhileLoadingFiveDaysForecastTheViewNotifies() {
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).nextFiveDaysWeatherForecast(location: any()).thenThrow(HTTPError.offline)
        }
        implementationUnderTest.loadNextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedWeatherForecastView).reloadNextFiveDaysForecastView(weatherType: any())
        verify(mockedWeatherForecastView).showOfflineAlert()
        verify(mockedWeatherForecastView).showFiveDaysForecastFailureView()
    }

    func testThatWhenAnUnknownErrorOccursWhenFetchingFiveDaysForecastInformationTheViewShowsAnErrorMessage() {
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).nextFiveDaysWeatherForecast(location: any()).thenThrow(TestDataGenerator.randomError)
        }
        implementationUnderTest.loadNextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedWeatherForecastView).reloadNextFiveDaysForecastView(weatherType: any())
        verify(mockedWeatherForecastView, never()).showOfflineAlert()
        verify(mockedWeatherForecastView).showFiveDaysForecastFailureView()
    }

    func testThatWhenFetchingOfFiveDaysForecastSucceedsThenTheViewUpdateAppropriateSection() {
        let weatherByDate = WeatherInformationByDate(dt: Date().addingTimeInterval(3600*24), weather: [TestDataGenerator.dummyWeather], main: TestDataGenerator.dummyWeatherInformation)
        stub(mockedWeatherForecastInteractor) { mock in
            when(mock).nextFiveDaysWeatherForecast(location: any()).thenReturn([weatherByDate])
        }
        implementationUnderTest.loadNextFiveDaysWeatherForecast(location: CLLocation())
        verify(mockedWeatherForecastView,times(2)).reloadNextFiveDaysForecastView(weatherType: any())
        verify(mockedWeatherForecastView, never()).showOfflineAlert()
        verify(mockedWeatherForecastView, never()).showCurrentWeatherFailureView()
    }
    
}
