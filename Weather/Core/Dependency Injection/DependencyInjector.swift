
//
//  DependencyInjector.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol DependencyInjector: Logger {
    func injected<Dependency>(_ serviceType: Dependency.Type) -> Dependency
}

extension DependencyInjector {
    func injected<Dependency>(_ serviceType: Dependency.Type) -> Dependency {
        return DependencyManager.resolve(serviceType)
    }
}
