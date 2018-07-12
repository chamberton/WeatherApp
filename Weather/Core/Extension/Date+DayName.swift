//
//  Date+DayName.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

public extension Date {
    var dayName: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
}

