//
//  ArticleMedia.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

struct ArticleMedia: Codable {
    let type:String
    let subtype:String
    let mediametadata:[ArticleMediaMetaData]

    
    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case mediametadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(String.self, forKey: .type)
        subtype = try values.decode(String.self, forKey: .subtype)
        mediametadata = try values.decode([ArticleMediaMetaData].self, forKey: .mediametadata)
    }
    
}



