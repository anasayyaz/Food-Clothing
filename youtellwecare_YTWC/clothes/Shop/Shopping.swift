//
//  Shopping.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 19/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit


class Shopping : UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Btn1_URL(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.nike.com")! as URL,options: [:], completionHandler: nil)
    }
    
    
    @IBAction func Btn2_URL(_ sender: UIButton) {
         UIApplication.shared.open(URL(string: "https://www.adidas.com/us")! as URL,options: [:], completionHandler: nil)
    }
    
    
    @IBAction func Btn3_URL(_ sender: UIButton) {
         UIApplication.shared.open(URL(string: "https://www.hm.com/entrance.ahtml?orguri=%2F")! as URL,options: [:], completionHandler: nil)
    }
    
    
    @IBAction func Btn4_URL(_ sender: UIButton) {
         UIApplication.shared.open(URL(string: "https://www.zara.com")! as URL,options: [:], completionHandler: nil)
    }
    
    
    @IBAction func Btn5_URL(_ sender: UIButton) {
            UIApplication.shared.open(URL(string: "https://www.abercrombie.com/shop/wd")! as URL,options: [:], completionHandler: nil)
       }
       
       
       @IBAction func Btn6_URL(_ sender: UIButton) {
            UIApplication.shared.open(URL(string: "https://www.breakout.com.pk")! as URL,options: [:], completionHandler: nil)
       }
    
    
}


