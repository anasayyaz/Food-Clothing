//
//  PostCell.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 19/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit


class PostCell : UITableViewCell
{
    
    
    @IBOutlet weak var postImageView :UIImageView!
    @IBOutlet weak var numberOfLikesButton: UIButton!
    @IBOutlet weak var timeAgoLabel :UILabel!
    @IBOutlet weak var postCaptionLabel :UILabel!
    
    
    var post : Post! {
        
        
        didSet{
            updateUI()
        }
        
    }
    
    func updateUI () {
        postImageView.image = post.image
        postCaptionLabel.text = post.caption
        numberOfLikesButton.setTitle(" ", for: .normal)
        timeAgoLabel.text = post.timeAgo
         

              
    }
}

