//
//  PostHeaderCell.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 18/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell
{

    @IBOutlet weak var profileImageView: UIImageView!
  //  @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var usernameButton: UIButton!


    var post: Post! {
        didSet{
             updateUI()

        }
    }
    func updateUI(){
        profileImageView.image = post.createdBy.profileImage
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
        profileImageView.layer.masksToBounds = true
        
        usernameButton.setTitle(post.createdBy.username!, for: .normal)
//        
//        followButton.layer.borderWidth = 1.0
//        followButton.layer.cornerRadius = 2.0
//        followButton.layer.borderColor = followButton.tintColor.cgColor
//        followButton.layer.masksToBounds = true


    }


}



