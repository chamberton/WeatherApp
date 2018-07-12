//
//  ConnectivityDetector.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol ConnectivityDetector {
    func startTrackingNetworkStatus()
    var isOnline: Bool { get }
}
