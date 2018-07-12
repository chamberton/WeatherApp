

//
//  DataStatus.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/11.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

enum DataStatus: Equatable {
    case missing
    case loading
    case available(value: Double, description: String)
}
