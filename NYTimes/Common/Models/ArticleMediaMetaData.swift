//
//  ArticleMediaMetaData.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation
struct ArticleMediaMetaData: Codable {
   
    let url:String
    let format:String
    let height:Int
    let width:Int

    enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decode(String.self, forKey: .url)
        format = try values.decode(String.self, forKey: .format)
        height = try values.decode(Int.self, forKey: .height)
        width = try values.decode(Int.self, forKey: .width)
    }
    
}
