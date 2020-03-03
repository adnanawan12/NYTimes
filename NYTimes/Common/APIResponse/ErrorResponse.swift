//
//  ErrorResponse.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

// We use this model if error is returned from server
struct ErrorResponse : Decodable {
    let fault: Fault
    
}
