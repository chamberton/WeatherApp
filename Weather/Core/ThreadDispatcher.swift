//
//  ThreadDispatcher.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/08.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit
public enum BackgroundQueuePriority: Int {
    case immediately
    case mediumDeferred
    case longDeferred
}

public class ThreadDispatcher: NSObject {
    private(set) var isTestRunner = false
    private static var runner: ThreadDispatcher!
    internal static let asyncBackgroundDispatchQueue = DispatchQueue(label: "globalBackgroundQueue", attributes: .concurrent)
    
    private init(isTestRunner: Bool) {
        self.isTestRunner = isTestRunner
    }
    
    class func initialiseRunner() {
        let isRunningTest: Bool
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            isRunningTest = true
        }else {
            isRunningTest = false
        }
        runner = ThreadDispatcher(isTestRunner: isRunningTest)
    }
   
    
    open static func runOnMain(_ action: @escaping () -> Void) {
        ThreadDispatcher.runner.runOnMain {
            action()
        }
    }
    
    open static func runOnGlobalQueue(priority: BackgroundQueuePriority = .mediumDeferred, _ action: @escaping () -> Void) {
        ThreadDispatcher.runner.runOnGlobalQueue(priority: priority) {
            action()
        }
    }
    
    open static func runInBackground(action: @escaping () -> Void) {
        ThreadDispatcher.runner.runInBackground {
            action()
        }
    }
    
    private func runOnGlobalQueue(priority: BackgroundQueuePriority, _ action: @escaping () -> Void) {
        if isTestRunner {
            action()
            return
        }
        let qos = QoS(for: priority)
        DispatchQueue.global(qos: qos).async {
            action()
        }
    }
    
    private func runOnMain(_ action: @escaping () -> Void) {
        if isTestRunner {
            action()
            return
        }
        DispatchQueue.main.async {
            action()
        }
    }
    
    private func runInBackground(_ action: @escaping () -> Void) {
        if isTestRunner {
            action()
            return
        }
        ThreadDispatcher.asyncBackgroundDispatchQueue.async {
            action()
        }
    }
    
    private func QoS(for priority: BackgroundQueuePriority) -> DispatchQoS.QoSClass {
        switch priority {
        case .immediately:
            return DispatchQoS.QoSClass.userInteractive
        case .mediumDeferred:
            return DispatchQoS.QoSClass.utility
        case .longDeferred:
            return DispatchQoS.QoSClass.background
        }
    }
}
