//
//  Model.swift
//  JSONPlaceholder
//
//  Created by Igor Shukyurov on 10/05/2019.
//  Copyright © 2019 Igor Shukyurov. All rights reserved.
//

import Foundation

typealias PostsModel = [PostModel]

struct PostModel: Codable {
    let userID: Int
    let id:     Int
    let title:  String
    let body:   String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
        case body
    }
}

// MARK: Convenience initializers and mutators
extension Array where Element == PostsModel.Element {
    init(data: Data) throws {
        print("PostsModel")
        self = try JSONDecoder().decode(PostsModel.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: URLSession response handlers
extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func postsTask(with url: URL, completionHandler: @escaping (PostsModel?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
