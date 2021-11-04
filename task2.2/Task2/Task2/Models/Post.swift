//
//  Post.swift
//  Task2
//
//  Created by Apple on 11/02/2021.
//

import Foundation

struct Post : Codable {
    let id : Int?
    let userId : Int?
    let title : String?
    let description : String?
    let image : String?
    var publishedTime : Date?
    
    enum CodingKeys : String, CodingKey {
        case id = "posts"
        case userId = "user_id"
        case title = "title"
        case description = "description"
        case image = "image"
        case publishedTime = "published_at"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(userId, forKey: .userId)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(image, forKey: .image)
        try container.encode(publishedTime, forKey: .publishedTime)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        publishedTime = nil
        // Fetching date string and converting to Swift date object
        if let publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedTime) {
            let dateFormatter = DateFormatter()
            // date format as per the service response
            dateFormatter.dateFormat = Constants.dateFormat
            publishedTime = dateFormatter.date(from:publishedAt)
        }
    }
}
