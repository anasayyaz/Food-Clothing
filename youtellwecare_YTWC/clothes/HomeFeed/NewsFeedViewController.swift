//
//  NewsFeedViewController.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 19/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit

class NewsFeedViewController : UITableViewController{
    
    var posts : [Post]?
    
    struct Storyboard {
        static let postCell = "PostCell"
        static let postHeaderCell = "PostHeaderCell"
        static let postHeaderheight : CGFloat = 56.0
        
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchPosts()
        
    }
    
    func fetchPosts(){
        posts = Post.fetchPosts()
        tableView.reloadData()
        
        
    }
}
extension NewsFeedViewController
{
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let posts = posts {
            return posts.count
        }
        return 0
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil{
            return 1
        }
        return 0
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postCell, for: indexPath) as! PostCell
        
        cell.post = posts?[indexPath.section]
        cell.selectionStyle = .none
        
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postHeaderCell) as! PostHeaderCell
        cell.post = posts?[section]
        cell.backgroundColor = .white
         
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Storyboard.postHeaderheight
    }
  
}
