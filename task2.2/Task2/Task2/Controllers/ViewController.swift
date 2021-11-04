//
//  ViewController.swift
//  Task2
//
//  Created by Apple on 11/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var placeholderLabel : UILabel!
    @IBOutlet weak var loader : UIActivityIndicatorView!
    
    //datasource
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //setting viewcontroller title
        self.title = Constants.postTitle
        // call the posts service
        self.getPosts()
    }
    
    // this function is responsible to get the posts from AFManager
    func getPosts() {
        self.loader.isHidden = false
        self.loader.startAnimating()
        AFManager.getPosts(completion: { posts in
            self.loader.stopAnimating()
            self.loader.isHidden = true
            if let posts = posts {
                self.posts = posts
            }
            else {
                self.posts = [Post]()
            }
            //Show placeholder label if there's no post and hide tableview
            self.placeholderLabel.isHidden = self.posts.count > 0
            self.tableView.isHidden = !self.placeholderLabel.isHidden
            self.tableView.reloadData()
        })
    }
}

// tableview datasource
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsIdentifier.PostCell.rawValue)! as! PostTableViewCell
        cell.updateCell(model: posts[indexPath.row])
        return cell
    }
    
}

