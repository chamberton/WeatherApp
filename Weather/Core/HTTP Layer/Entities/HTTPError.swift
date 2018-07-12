
//
//  HTTPError.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

enum HTTPError: Error {
   case offline
   case timedOut
   case notFound
   case failed
   case invalidURL
}
