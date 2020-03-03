//
//  ArticlesResponse.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

// This model is used to parse API response of movies list
struct ArticlesResponse : Decodable {
    let status: String
    let copyright:String
    let num_results: Int
    let results: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case num_results
        case results
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decode(String.self, forKey: .status)
        copyright = try values.decode(String.self, forKey: .copyright)
        num_results = try values.decode(Int.self, forKey: .num_results)
        results = try values.decode([Article].self, forKey: .results)
    }
}
