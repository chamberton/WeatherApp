//
//  Cache.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol Cache {
    var isValid: Bool { get }
    func invalidate()
    func clear()
    func update(fetchedObject: Any, timeToLive: TimeInterval)
}
