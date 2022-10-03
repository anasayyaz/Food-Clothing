//
//  Media.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 18/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit


struct Post {
    var createdBy : User
    var timeAgo : String?
    var caption : String?
    var image : UIImage?
    var numberOfLikes : Int?
    var numberOfComments : Int?
    var numberOfShares : Int?

    static func fetchPosts() -> [Post]
    {
        var posts = [Post]()
        let duc1 = User(username:"YTWC",
                       profileImage: UIImage(named: "hsy1"))
        
        let duc2 = User(username:"YTWC",
                       profileImage: UIImage(named: "dp1"))

        
        let duc3 = User(username:"YTWC",
                       profileImage: UIImage(named: "na1"))

        
        let duc4 = User(username:"YTWC",
                       profileImage: UIImage(named: "aa1"))

        
        let duc5 = User(username:"Khawar Riaz",
                       profileImage: UIImage(named: "kr1"))



        let post1 = Post(createdBy: duc1, timeAgo: "", caption: "  you can wear a black leather jacket and add in a dark brown chocolate chelsea boot. Go for it. ", image: UIImage(named: "feed2"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        
         let post2 = Post(createdBy: duc1, timeAgo: "", caption: "  It was seen as a sign of sophistication and refinement when that level of detail was given.", image: UIImage(named: "feed1"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        let post3 = Post(createdBy: duc2, timeAgo: "", caption: " You either know fashion or you don’t. – Anna Wintour  ", image: UIImage(named: "feed3"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        
        let post4 = Post(createdBy: duc2, timeAgo: "", caption: "  Style is a way to say who you are without having to speak. – Rachel Zoe ", image: UIImage(named: "feed4"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        let post5 = Post(createdBy: duc3, timeAgo: "", caption: " Always dress like you’re going to see your worst enemy  ", image: UIImage(named: "na2"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        let post6 = Post(createdBy: duc3, timeAgo: "", caption: "Nomi Ansari new collection for men  ", image: UIImage(named: "na3"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        let post7 = Post(createdBy: duc4, timeAgo: "", caption: "Fashion is the armor to survive the reality of everyday life.   ", image: UIImage(named: "aa2"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        let post8 = Post(createdBy: duc4, timeAgo: "", caption: " I don’t do fashion. I am fashion  ", image: UIImage(named: "aa3"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        let post9 = Post(createdBy: duc5, timeAgo: "", caption: " Khawar Raiz is getting famous now a days!  ", image: UIImage(named: "kr2"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )
        
        let post10 = Post(createdBy: duc5, timeAgo: "", caption: "  Make it simple, but significant ", image: UIImage(named: "kr3"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 32  )







         
        
        posts.append(post1)
         posts.append(post2)
         posts.append(post3)
         posts.append(post4)
         posts.append(post5)
         posts.append(post6)
         posts.append(post7)
        posts.append(post8)
         posts.append(post9)
         posts.append(post10)
        
        return posts
        
    }
 }

//struct User {
//    var username : String?
//    var profileImage : UIImage?
//
//
//}

