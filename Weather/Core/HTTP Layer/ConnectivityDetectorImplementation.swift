//
//  ConnectivityDetectorImplementation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
import Reachability

class ConnectivityDetectorImplementation: ConnectivityDetector, Logger {
    private let reachability = Reachability(hostname: "www.google.co.za")!
    private(set) var isReachable: Bool = false
    
    func startTrackingNetworkStatus() {
        isReachable =  reachability.connection != .none
        do {
            try reachability.startNotifier()
            NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged),name: Notification.Name.reachabilityChanged ,object: reachability)
        } catch {
            log("could not start reachability notifier")
        }
    }
    
    var isOnline: Bool {
        return isReachable
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        isReachable =  reachability.connection != .none
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
