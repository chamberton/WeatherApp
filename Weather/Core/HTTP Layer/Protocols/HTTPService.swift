//
//  HTTPService.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol HTTPService: DependencyInjector {
    var httpGetClient: SynchronousHTTPGetClient { get }
    var urlInteractor: URLInteractor { get }
    var endpointsInteractor: EndpointsInteractor { get }
}

extension HTTPService {
    var httpGetClient: SynchronousHTTPGetClient {
        return injected(SynchronousHTTPGetClient.self)
    }
    var urlInteractor: URLInteractor {
        return injected(URLInteractor.self)
        
    }
    var endpointsInteractor: EndpointsInteractor {
        return injected(EndpointsInteractor.self)
    }
}
