//
//  AFManager.swift
//  Task2
//
//  Created by Apple on 11/02/2021.
//

import Foundation
import Alamofire

// All the endpoints to be used in the app will be here
enum Endpoints : String {
    case getPosts = "http://www.mocky.io/v2/59f2e79c2f0000ae29542931"
}

class AFManager {
    
    //To get posts
    static func getPosts(urlString : String = Endpoints.getPosts.rawValue , completion : @escaping ([Post]?) -> Void) {
        
        AF.request(urlString,method: .get).response { response in
            guard let data = response.data else { return }
            debugPrint(response)
            do {
                let decoder = JSONDecoder()
                let postList = try decoder.decode(PostList.self, from: data)
                debugPrint(postList)
                completion(postList.posts)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    
    //To get images from url
    static func getImageFromUrl(urlString : String , completion : @escaping (UIImage?) -> Void) {
        AF.request(urlString).response { response in
            if let data = response.data {
                let image = UIImage(data: data)
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
    
}
