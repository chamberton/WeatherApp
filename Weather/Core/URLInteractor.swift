
//
//  URLInteractor.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

class URLInteractor {
    public func urlPathWith(absolute: String, relative: String) -> String {
        guard let url = urlWith(absolute + relative) else {
            if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
                assertionFailure("Invalid url")
            }
            return ""
        }
        return url.absoluteString
    }
    
    public func urlWith(_ urlPath: String) -> URL? {
        return URL(string: urlPath)
    }
}
