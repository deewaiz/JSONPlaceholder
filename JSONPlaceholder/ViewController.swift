//
//  ViewController.swift
//  JSONPlaceholder
//
//  Created by Igor Shukyurov on 09/05/2019.
//  Copyright © 2019 Igor Shukyurov. All rights reserved.
//

import UIKit

/*struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
}

var posts: [Post] = Array()

func net() -> [Post] {
    var ret: [Post] = Array()
    let session = URLSession.shared
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    let task = session.dataTask(with: url) { data, response, error in
        if error != nil || data == nil {
            print("Client error!")
            return
        }
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print("Server error!")
            return
        }
        guard let mime = response.mimeType, mime == "application/json" else {
            print("Wrong MIME type!")
            return
        }
        
        guard let data = data else { return }
        do {
            //let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            posts = try! JSONDecoder().decode([Post].self, from: data)
            //print("json")
            //dump(posts)
            ret = posts
            //dump(ret)
            //dump(self.posts)
            //print(posts[0].id, posts[99].id)
            //print(type(of: posts))
            //let posts1: Posts = posts
            
        } catch {
            print("JSON error: \(error.localizedDescription)")
        }
    }
    task.resume()
    //print("net")
    //dump(ret)
    return ret
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad started")
        posts = net()
        print("viewDidLoad ended")

        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        print("viewDidAppear started")
        dump(posts)
        print("viewDidAppear ended")
        //performSegue(withIdentifier: "segueToTableView", sender: self)

    }
}
*/
