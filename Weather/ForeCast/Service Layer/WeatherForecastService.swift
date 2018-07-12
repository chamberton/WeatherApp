//
//  WeatherForecastService.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import Result

class WeatherForecastService: HTTPService {
    private var jsonDecoder: JSONDecoder {
        let jsonDecoder =  JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateSecondsSince1970 = try container.decode(Double.self)
            let date = Date(timeIntervalSince1970: dateSecondsSince1970)
            return date
        }
        return jsonDecoder
    }
    
    func fetchCurrentWeatherInformation(request: CurrentWeatherRequest) -> CurrentWeatherResponse {
        let httpResponse = self.httpResponse(for: request)
        
        if let error = (httpResponse.mapError { $0 }.error) {
            return CurrentWeatherResponse(responseObject: nil, error: error)
        }
        guard let currentWeatherInformation: CurrentWeatherInformation? = httpResponse.map(object).value else {
            return CurrentWeatherResponse(responseObject: nil, error: HTTPError.failed)
        }
        let error: HTTPError? = currentWeatherInformation == nil ? HTTPError.notFound : nil
        return CurrentWeatherResponse(responseObject: currentWeatherInformation, error: error)
    }
    
    func fetchFiveDayWeatherForecast(request: FiveDayWeatherForecastRequest) -> FiveDayWeatherForecastResponse {
        let httpResponse = self.httpResponse(for: request)
        if let error = (httpResponse.mapError { $0 }.error) {
            return FiveDayWeatherForecastResponse(responseObject: nil, error: error)
        }
        
        DependencyManager.registerSingleInstance({ self.jsonDecoder }, for: JSONDecoder.self)
        // Switch the special decoder off, just after the method goes out of scope
        defer {
            DependencyManager.registerSingleInstance({ JSONDecoder() }, for: JSONDecoder.self)
        }
        
        guard let fiveDayWeatherForecast: FiveDayWeatherForecast? = httpResponse.map(object).value else {
            return FiveDayWeatherForecastResponse(responseObject: nil, error: HTTPError.failed)
        }
        let error: HTTPError? = fiveDayWeatherForecast == nil ? HTTPError.notFound : nil
        return FiveDayWeatherForecastResponse(responseObject: fiveDayWeatherForecast, error: error)
    }
    
    private func httpResponse(for request: HTTPRequest) -> Result<Data, HTTPError> {
        let headers = request.headers
        let parameters = request.pathParameters
        let url = urlInteractor.urlPathWith(absolute: endpointsInteractor.weatherAPIHostURL, relative: request.relativePath)
        return httpGetClient.get(from: url, paremeters: parameters, headers: headers)
    }
}
