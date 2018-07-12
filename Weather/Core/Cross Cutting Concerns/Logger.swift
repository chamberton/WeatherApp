//
//  Logger.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Foundation
import SwiftyBeaver

protocol Logger {
    func log(_ object: Any)
}

extension Logger {
    public func log(_ object: Any) {
        LoggerInstance.shared.log.verbose(object)
    }
}

private class LoggerInstance {
    private(set) var log = SwiftyBeaver.self
    let console = ConsoleDestination()
    private(set) static var shared = LoggerInstance()
    
    private init() {
        console.format = "$DHH:mm:ss$d $L $M"
        log.addDestination(console)
        let file = FileDestination.init()
        log.addDestination(file)
    }
}
