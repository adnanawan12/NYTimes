//
//  Fault.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

struct Fault: Codable {
    let faultstring:String
   
    enum CodingKeys: String, CodingKey {
        case faultstring
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        faultstring = try values.decode(String.self, forKey: .faultstring)
        
    }
    
}
