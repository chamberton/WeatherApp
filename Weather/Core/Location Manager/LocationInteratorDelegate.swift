//
//  LocationInteractorDelegate.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationInteractorDelegate: class {
    func userLocationChanged(location: CLLocation)
    func deviceIsLoadingLocation()
}
