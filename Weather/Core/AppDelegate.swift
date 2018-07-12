//
//  AppDelegate.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ThreadDispatcher.initialiseRunner()
        if DependencyManager.registerImplementations() {
            return performInitialisation() // This gives us control of the first screen to be presented
        }
        return false
    }
    
    public func performInitialisation() -> Bool {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let forecastScreenID = String(describing: WeatherForecastViewController.self)
        guard let weatherForecastViewController = mainStoryboard.instantiateViewController(withIdentifier: forecastScreenID) as? WeatherForecastViewController else {
            return false
        }
        window = UIWindow()
        window?.rootViewController = weatherForecastViewController
        window?.makeKeyAndVisible()
        return true
    }
}

