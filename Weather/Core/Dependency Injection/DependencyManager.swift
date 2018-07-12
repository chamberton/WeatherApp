
//
//  DependencyManager.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import Foundation

public final class DependencyManager {
    private static let dependencyContainer = DependencyContainer()
    
    public static func registerImplementations() -> Bool {
        // MARK: - Multiple instances
        dependencyContainer.register({ SynchronousHTTPGetClientImplementation() }, for: SynchronousHTTPGetClient.self)
        dependencyContainer.register({ WeatherForecastService() }, for: WeatherForecastService.self)
        dependencyContainer.register({ URLInteractor() }, for: URLInteractor.self)
        dependencyContainer.register({ WeatherForecastInteractor() }, for: WeatherForecastInteractor.self)
        
        // MARK: - Singletons
        dependencyContainer.registerSingleInstance({ WeatherForecastCacheImplementation()! }, for: WeatherForecastCache.self)
        dependencyContainer.register({ SynchronousHTTPGetClientImplementation() }, for: SynchronousHTTPGetClient.self)
        dependencyContainer.registerSingleInstance({ ConnectivityDetectorImplementation() }, for: ConnectivityDetector.self)
        dependencyContainer.registerSingleInstance({ EndpointsInteractor()! }, for: EndpointsInteractor.self)
        dependencyContainer.registerSingleInstance({ HeaderInjector()! }, for: HeaderInjector.self)
        dependencyContainer.registerSingleInstance({ URLSessionProvider() }, for: URLSessionProvider.self)
        dependencyContainer.registerSingleInstance({ JSONDecoder() }, for: JSONDecoder.self)
        dependencyContainer.registerSingleInstance({ FiveDaysForecastCacheImplementation()! }, for: FiveDaysForecastCache.self)
        
        // avoid the spread of CLLocationManager, we only need one instance of CLLocationManager
        dependencyContainer.registerSingleInstance({ LocationInterator() }, for: LocationInterator.self)
        return true
    }
    
    // MARK: - Registration of dependecies
    
    class public func register<Abstract>(_ concrete: @escaping () -> Abstract, for serviceType: Abstract.Type) {
        dependencyContainer.register(concrete, for: serviceType)
    }
    
    class public func registerSingleInstance<Abstract>(_ concrete: @escaping () -> Abstract, for abstractType: Abstract.Type) {
        dependencyContainer.registerSingleInstance(concrete, for: abstractType)
    }
    
    // MARK: - Resolution of dependecies
    
    class public func resolve<Abstract>(_ abstractType: Abstract.Type) -> Abstract {
        return dependencyContainer.resolve(abstractType)
    }
    
    class public func resolve<Abstract>(_ abstractType: Abstract.Type, name: String?) -> Abstract {
        return dependencyContainer.resolve(abstractType,name: name)
    }
}
