//
//  PostList.swift
//  Task2
//
//  Created by Apple on 11/02/2021.
//

import Foundation

struct PostList : Codable {
    let posts : [Post]
    
    enum CodingKeys : String, CodingKey {
        case posts = "posts"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(posts, forKey: .posts)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        posts = try values.decodeIfPresent([Post].self, forKey: .posts) ?? [Post]()
    }
}
