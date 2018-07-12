//
//  HeaderInjector.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

class HeaderInjector: Logger {
    private(set) var weatherApiKey: String = ""
    
    init?() {
        guard updateAPIKey() else {
            return nil
        }
    }
    
    func updateAPIKey() -> Bool {
        var keyedEndpoints: NSDictionary?
        if let path = Bundle.main.path(forResource: "URLInfo", ofType: "plist") {
            keyedEndpoints = NSDictionary(contentsOfFile: path)
        }
        guard let urlEndpoints = keyedEndpoints as? [String: Any] else {
            log("URLInfo property list file is missing")
            return false
        }
        if let weatherApiKey = urlEndpoints[URLPlistInfoKeys.APIKey] as? String  {
            self.weatherApiKey = weatherApiKey
        }else {
            log("Missing API Key")
            return false
        }
        return true
    }
}
