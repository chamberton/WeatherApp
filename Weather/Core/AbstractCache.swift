//
//  AbstractCache.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

class AbstractCache: DependencyInjector {
    open var isValid: Bool {
        return expiryDate > Date()
    }
    open var expiryDate: Date = .distantFuture
    open var isHTTPResponseValid: Bool = true
    
    init?() {
        guard type(of: self) != AbstractCache.self else {
            log("Attempt to create instance of an abstract class")
            return nil
        }
        _ = NotificationCenter.default.addObserver(forName: .UIApplicationDidReceiveMemoryWarning, object: nil, queue: .current, using: shouldClear)
    }
    
    func updateHTTPResponseStatus(isValid: Bool) {
        isHTTPResponseValid = isValid
    }
    
    private lazy var shouldClear: (Notification) -> Void = { [weak self] notification in
        self?.clear()
    }
    
    func clear() {
        expiryDate = .distantPast
        isHTTPResponseValid = true
    }
    
    func invalidate() {
        expiryDate = .distantPast
        isHTTPResponseValid = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
