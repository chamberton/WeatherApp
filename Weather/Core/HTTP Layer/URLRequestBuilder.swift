//
//  URLRequestBuilder.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

public class URLRequestBuilder {
    var urlString: String?
    var httpMethod: String?
    var bodyData: Data?
    var paramaters: HTTPDictionary? = HTTPDictionary()
    var body: HTTPDictionary?
    var headers = HTTPDictionary()
    
    public func setURLString(_ urlString: String?) -> URLRequestBuilder {
        self.urlString = urlString
        return self
    }
    
    public func setHTTPMethod(_ httpMethod: String?) -> URLRequestBuilder {
        self.httpMethod = httpMethod
        return self
    }
    
    public func setBody(_ body: HTTPDictionary?) -> URLRequestBuilder {
        self.body = body
        return self
    }
    
    public func setBodyData(_ bodyData: Data) -> URLRequestBuilder {
        self.bodyData = bodyData
        return self
    }
    
    public func setParameters(_ paramaters: HTTPDictionary?) -> URLRequestBuilder {
        self.paramaters = paramaters
        return self
    }
    
    public func setHeaders(_ headers: HTTPDictionary) -> URLRequestBuilder {
        self.headers = headers
        return self
    }
    
    public func build() -> URLRequest? {
        guard (body == nil) || (bodyData == nil) else {
            print("Both body and bodydata cannot be valid. It's either or.")
            return nil
        }
        guard let urlString =  self.urlString else {
            return nil
        }
        
        guard let urlWithoutParameter = URL(string: urlString)else {
            return nil
        }
        
        guard var components = URLComponents(url: urlWithoutParameter, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        let isOperationCompleted = setPathParameters(to: &components, paramaters: paramaters )
        guard isOperationCompleted, let url = components.url else {
            return nil
        }
        
        var urlRequest = URLRequest.init(url: url)
        
        if let body = self.body, !body.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        }
        
        if let bodyData = self.bodyData {
            urlRequest.httpBody = bodyData
        }
        
        urlRequest.allHTTPHeaderFields = headers.mapValues({
            return $0.valueInHTTPRequest
        })
        urlRequest.httpMethod = httpMethod
        reinitialiseBuilder()
        return urlRequest
    }
    
    private func reinitialiseBuilder() {
        urlString = nil
        httpMethod = nil
        paramaters = HTTPDictionary()
        body = nil
        headers = HTTPDictionary()
    }
    
    func setPathParameters(to components: inout URLComponents, paramaters: HTTPDictionary?) -> Bool {
        guard let paramaters = paramaters else {
            return true
        }
        for (key,value) in paramaters {
            let escapedValue = value.valueInHTTPRequest.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            if components.queryItems == nil {
                components.queryItems = [URLQueryItem]()
            }
            components.queryItems?.append(URLQueryItem(name: key, value: escapedValue ))
        }
        return true
    }
}
