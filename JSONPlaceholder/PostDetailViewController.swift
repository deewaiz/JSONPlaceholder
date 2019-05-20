//
//  PostDetailViewController.swift
//  JSONPlaceholder
//
//  Created by Igor Shukyurov on 20/05/2019.
//  Copyright © 2019 Igor Shukyurov. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    // MARK: Model
    var postsModelController: PostsModelController!
    var postID: Int = -1
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let post: PostModel = postsModelController.selectPost(withID: postID)
        userIDLabel.text = String(post.userID)
        idLabel.text = String(post.id)
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
    @IBAction func saveAction(_ sender: Any) {
        postsModelController.updatePosts(withID: postID, newPost: PostModel(userID: Int(userIDTextField!.text!)!,
                                                                            id: Int(idTextField.text!)!,
                                                                            title: titleTextField.text!,
                                                                            body: bodyTextField.text!) as PostModel)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
