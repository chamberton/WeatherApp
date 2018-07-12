
//
//  Decodable+Customisation.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

extension KeyedDecodingContainer {
    public func decodeIfPresent(_ type: Double.Type, forKey key: K) throws -> Double? {
        if contains(key) {
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func decodeIfPresent(_ type: String.Type, forKey key: K) throws -> String? {
        if contains(key) {
            return try? decode(type, forKey: key)
        }
        return nil
    }
    
    public func decodeIfPresent(_ type: String.Type, forKey key: K) throws -> String {
        if contains(key) {
            do {
                return try decode(type, forKey: key)
            } catch {
                return ""
            }
        }
        return ""
    }
    
    public func decodeIfPresent(_ type: Int.Type, forKey key: K) throws -> Int? {
        if contains(key) {
            return try? decode(type, forKey: key)
        }
        return nil
    }
}

func object<T:Codable>(from httpResponseData: Data) -> T? {
    let jsonDecoder = DependencyManager.resolve(JSONDecoder.self)
    guard let object = try? jsonDecoder.decode(T.self, from: httpResponseData) else {
        return nil
    }
    return object
}
