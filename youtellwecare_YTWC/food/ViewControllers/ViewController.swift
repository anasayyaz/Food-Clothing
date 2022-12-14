//
//  ViewController.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 08/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    
    
    
    var videoPlayer:AVPlayer?
          
          var videoPlayerLayer:AVPlayerLayer?

    @IBOutlet weak var SignUpButton: UIButton!
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        

    setUpElements()
    }
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    
    
    func setUpElements() {
        
        Utilities.styleFilledButton(SignUpButton)
        Utilities.styleHollowButton(LoginButton)
        
    }


func setUpVideo() {
             
             // Get the path to the resource in the bundle
             let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
             
             guard bundlePath != nil else {
                 return
             }
             
             // Create a URL from it
             let url = URL(fileURLWithPath: bundlePath!)
             
             // Create the video player item
             let item = AVPlayerItem(url: url)
             
             // Create the player
             videoPlayer = AVPlayer(playerItem: item)
  
      
             // Create the layer
             videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
             
             // Adjust the size and frame
    videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 1, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
             
             view.layer.insertSublayer(videoPlayerLayer!, at: 0)
             
             // Add it to the view and play it
   
    videoPlayer?.playImmediately(atRate: 0.8)
         }
    
    
   

     }



 

 /*
 // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
 }
 */

