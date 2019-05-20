//
//  PostModelController.swift
//  JSONPlaceholder
//
//  Created by Igor Shukyurov on 17/05/2019.
//  Copyright © 2019 Igor Shukyurov. All rights reserved.
//

import Foundation

class PostsModelController{
    var posts: PostsModel = try! PostsModel.init(fromURL: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    
    func selectPost(withID: Int) -> PostModel {
        return posts[withID]
    }
    
    func updatePosts(withID: Int, newPost: PostModel) {
        //var posts: PostsModel = self.posts
        posts[withID] = newPost
    }
}
