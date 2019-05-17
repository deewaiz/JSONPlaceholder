//
//  PostModelController.swift
//  JSONPlaceholder
//
//  Created by Igor Shukyurov on 17/05/2019.
//  Copyright © 2019 Igor Shukyurov. All rights reserved.
//

import Foundation

class PostModelController{
    var posts: Posts = try! Posts.init(fromURL: URL(string: "https://jsonplaceholder.typicode.com/posts")!)

}
