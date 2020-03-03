//
//  Article.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

struct Article: Codable {
    let id: Int64
    let uri: String
    let url:String
    let title:String
    let abstract:String
    let published_date:String
    let media:[ArticleMedia]

    
    enum CodingKeys: String, CodingKey {
        case id
        case uri
        case url
        case title
        case abstract
        case published_date
        case media
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int64.self, forKey: .id)
        uri = try values.decode(String.self, forKey: .uri)
        url = try values.decode(String.self, forKey: .url)
        title = try values.decode(String.self, forKey: .title)
        abstract = try values.decode(String.self, forKey: .abstract)
        published_date = try values.decode(String.self, forKey: .published_date)
        media = try values.decode([ArticleMedia].self, forKey: .media)
    }
    
}
