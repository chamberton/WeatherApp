//
//  Color+HexadecimalValue.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/11.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit


public extension UIColor {
    
    private static func isValidHex(_ hexString: String) -> Bool {
        guard !hexString.isEmpty else {
            return false
        }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9","a","b","c","d","e","f","A","B","C","D","E","F"]
        return Set(hexString).isSubset(of: nums)
    }
    
    public convenience init?(hex: String) {
        let hexString: String = (hex as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        
        if hexString.count != 7 || hexString.hasPrefix("#")==false {
            return nil
        }
        let prefixIndex = hexString.index(hexString.startIndex, offsetBy: 1)
        let numericPortion = String(hexString[prefixIndex..<hexString.endIndex])
        
        guard numericPortion.count == 6 && UIColor.isValidHex(numericPortion) else {
            return nil
        }
        let scanner = Scanner(string: hexString as String)
        scanner.scanLocation = 1
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
}
