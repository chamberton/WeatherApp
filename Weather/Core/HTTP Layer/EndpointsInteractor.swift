//
//  EndpointsInteractor.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

class EndpointsInteractor: Logger {
    private(set) var weatherAPIHostURL: String!
    
    init?() {
        guard configureEndpoints() else {
            return nil
        }
    }
    
    private func configureEndpoints() -> Bool {
        var keyedEndpoints: NSDictionary?
        if let path = Bundle.main.path(forResource: "URLInfo", ofType: "plist") {
            keyedEndpoints = NSDictionary(contentsOfFile: path)
        }
        guard let urlEndpoints = keyedEndpoints as? [String: Any] else {
            log("URLInfo property list file is missing")
            return false
        }
        if let weatherAPIHostURL = urlEndpoints[URLPlistInfoKeys.weatherAPIHostURLKey] as? String  {
            self.weatherAPIHostURL = weatherAPIHostURL
        }else {
            log("Missing weatherAPIHostURL")
            return false
        }
        return true
    }
}
