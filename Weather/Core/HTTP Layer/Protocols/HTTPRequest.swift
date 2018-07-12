//
//  HTTPRequest.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol HTTPRequest: DependencyInjector {
    var pathParameters: HTTPDictionary? { get }
    var bodyParameters: HTTPDictionary? { get }
    var headers: HTTPDictionary { get }
    var relativePath: String { get }
    var headerInjector: HeaderInjector { get }
}

extension HTTPRequest {
     var headerInjector: HeaderInjector {
        return injected(HeaderInjector.self)
     }
}
