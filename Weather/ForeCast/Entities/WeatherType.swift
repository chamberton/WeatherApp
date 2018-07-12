

//
//  WeatherType.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/11.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

enum WeatherType: String {
    case cloudy = "Clouds"
    case rainy = "Rain"
    case sunny = "Clear"
    case unknown
    
    var associatedColor: UIColor? {
        switch self {
        case .cloudy:
            return UIColor(hex: "#54717A")
        case .rainy:
            return UIColor(hex: "#57575D")
        case .sunny:
            return UIColor(hex: "#47AB2F")
        default:
            return nil
        }
    }
    
    var associatedIcon: UIImage? {
        switch self {
        case .cloudy:
            return UIImage(named: "partlysunny")
        case .rainy:
            return UIImage(named: "rain")
        case .sunny:
            return UIImage(named: "clear")
        default:
            return nil
        }
    }
    
    var associatedImage: UIImage? {
        switch self {
        case .cloudy:
            return UIImage(named: "forest_cloudy.png")
        case .rainy:
            return UIImage(named: "forest_rainy.png")
        case .sunny:
            return UIImage(named: "forest_sunny.png")
        default:
            return nil
        }
    }
}
