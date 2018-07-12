
//
//  HTTPDictionary.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
public protocol HTTPArgument {
    var valueInHTTPRequest: String { get }
}
public typealias HTTPDictionary = [String: HTTPArgument]

extension String: HTTPArgument {
    public var valueInHTTPRequest: String {
        return self
    }
}

extension NSNumber: HTTPArgument {
    public var valueInHTTPRequest: String {
        return self.stringValue
    }
}

extension Int: HTTPArgument {
    public var valueInHTTPRequest: String {
        return String(self)
    }
}

extension Double: HTTPArgument {
    public var valueInHTTPRequest: String {
        return String(self)
    }
}
