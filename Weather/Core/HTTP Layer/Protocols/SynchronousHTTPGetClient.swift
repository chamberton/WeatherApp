//
//  SynchronousHTTPGetClient.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import Foundation
import Result

protocol SynchronousHTTPGetClient {
    func get(from urlString: String, paremeters: HTTPDictionary?, headers: HTTPDictionary) -> Result<Data, HTTPError>
}
