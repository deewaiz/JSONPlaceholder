//
//  PostsTableViewController.swift
//  JSONPlaceholder
//
//  Created by Igor Shukyurov on 17/05/2019.
//  Copyright © 2019 Igor Shukyurov. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    // MARK: Model
    var postsModelController: PostsModelController!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(postsModelController.posts)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    // MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsModelController.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath)
        cell.textLabel?.text = postsModelController.posts[indexPath.row].title
        return cell
    }
    
    // Выбрана ячейка таблицы
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Выбрана ", indexPath.row)
        performSegue(withIdentifier: "toPostDetailSegue", sender: indexPath.row)
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailSegue" {
            if let postDetailViewController = segue.destination as? PostDetailViewController {
                postDetailViewController.postsModelController = postsModelController
                postDetailViewController.postID = sender as! Int
            }
        }
    }
}
