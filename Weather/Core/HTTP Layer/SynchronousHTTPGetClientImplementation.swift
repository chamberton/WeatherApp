//
//  SynchronousHTTPGetClientImplementation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import Result

class SynchronousHTTPGetClientImplementation: SynchronousHTTPGetClient, DependencyInjector {
    private let timeoutInterval = TimeInterval(20.00)
    private let urlRequestBuilder = URLRequestBuilder()
    private lazy var synchronousDispatchGroup = DispatchGroup()
    private lazy var reachabilityDetector: ConnectivityDetector = injected(ConnectivityDetector.self)
    private lazy var urlSessionProvider: URLSessionProvider = injected(URLSessionProvider.self)
    
    init() {
        reachabilityDetector.startTrackingNetworkStatus()
    }
    
    private func assertNotInMainThread() {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
            assert(!Thread.isMainThread,"Service Calls must be made in the background thread")
        }
    }
    
    private func performHTTPOperation(for urlRequest: URLRequest) -> Result<Data,HTTPError> {
        var httpResponseData: Data?
        var httpOperationError: HTTPError?

        log("\n Performing HTTP \(String(describing: urlRequest.httpMethod))\n Operation at \(String(describing: urlRequest.url!.absoluteString))\n Headers: \(String(describing: urlRequest.allHTTPHeaderFields))\n Body: \(String(describing: urlRequest.httpBody))")
        
        synchronousDispatchGroup.enter()
        ThreadDispatcher.runOnMain {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        let task = urlSessionProvider.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error)  in
            guard let httpResponse = response as? HTTPURLResponse else {
                httpOperationError = .failed
                self.synchronousDispatchGroup.leave()
                return
            }
            let statusCode = httpResponse.statusCode
            
            if 404 == statusCode {
                httpOperationError = .notFound
            }else if let data = data, 200...299 ~= statusCode {
                httpResponseData = data
            }else {
                httpOperationError = .failed
            }
            self.synchronousDispatchGroup.leave()
        })
        task.resume()
        synchronousDispatchGroup.wait()
        ThreadDispatcher.runOnMain {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        guard let responseData = httpResponseData else {
            log("HTTP Operation failed for: \(urlRequest)")
            if let error = httpOperationError {
                return .failure(error)
            } else {
                return .failure(HTTPError.failed)
            }
        }
        return .success(responseData)
    }
    
    func get(from urlString: String, paremeters: HTTPDictionary?, headers: HTTPDictionary) -> Result<Data, HTTPError> {
        assertNotInMainThread()
        
        if !reachabilityDetector.isOnline {
            return .failure(HTTPError.offline)
        }
        guard var urlRequest = urlRequestBuilder.setHeaders(headers).setURLString(urlString).setParameters(paremeters).setHTTPMethod(HTTPVerb.GET.rawValue).build() else {
            return .failure(HTTPError.invalidURL)
        }
        urlRequest.timeoutInterval = timeoutInterval
        return performHTTPOperation(for: urlRequest)
    }
}
