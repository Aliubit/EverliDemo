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
    @IBOutlet weak var filterSwitch : UISwitch!
    
    //datasource
    var posts = [Post]()
    var filteredPosts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //setting viewcontroller title
        self.title = Constants.postTitle
        // call the posts service
        self.getPosts()
        // register for switch toggle action
        self.filterSwitch.addTarget(self, action: #selector(switchChanged), for:UIControl.Event.valueChanged)
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
            //self.tableView.reloadData()
            self.filterPostsDataSource()
        })
    }
    
    // This function is responsible for filtering posts data source according to switch
    func filterPostsDataSource() {
        if self.filterSwitch.isOn {
            //filteredPosts = posts
            filteredPosts = posts.filter { (post) -> Bool in
               return (post.userId ?? -1) == 1
            }
            filteredPosts = filteredPosts.sorted { (first, second) -> Bool in
                return (first.publishedTime ?? Date()) > (second.publishedTime ?? Date())
            }
        }
        else {
            filteredPosts = posts
        }
        self.tableView.reloadData()
    }
}

// tableview datasource
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsIdentifier.PostCell.rawValue)! as! PostTableViewCell
        cell.updateCell(model: filteredPosts[indexPath.row])
        return cell
    }
    
}

// SWITCH toggle
extension ViewController {
    @objc func switchChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        print(value)
        filterPostsDataSource()
    }
}

