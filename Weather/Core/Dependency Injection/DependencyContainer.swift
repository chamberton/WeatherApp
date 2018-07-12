
//
//  DependencyContainer.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import Swinject

class DependencyContainer {
    private let container = Container()
    
    func register<Abstract>(_ concrete: @escaping () -> Abstract, for abstractType: Abstract.Type) {
        container.register(abstractType, factory: { _ in
            concrete()
        })
    }
    
    func registerSingleInstance<Abstract>(_ concrete: @escaping () -> Abstract, for abstractType: Abstract.Type) {
        container.register(abstractType, factory: { _ in
            concrete()
        }).inObjectScope(.container)
    }
    
    func resolve<Abstract>(_ abstractType: Abstract.Type) -> Abstract {
        objc_sync_enter(self)
        guard let concreteImplemenation = container.resolve(abstractType) else {
            fatalError("No concrete implementation was registered for \(abstractType)")
        }
        objc_sync_exit(self)
        return concreteImplemenation
    }
    
    func resolve<Abstract>(_ serviceType: Abstract.Type, name: String?) -> Abstract {
        objc_sync_enter(self)
        guard let resolvedImplementation = container.resolve(serviceType) else {
            preconditionFailure("No concrete implementation was registered for \(serviceType)")
        }
        objc_sync_exit(self)
        return resolvedImplementation
    }
}
