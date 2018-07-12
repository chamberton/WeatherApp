
//
//  HTTPResponse.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol HTTPResponse {
    associatedtype T: Codable
    var responseObject: T? { get }
    var error: HTTPError? { get }
}
