//
//  LocationView.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 12/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit

@IBDesignable class LocationView: BaseView {

    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow: (() -> Void)?
    
    
    @IBAction func allowActioin(_ sender: UIButton){
        didTapAllow?()
    }
    
    @IBAction func denyActioin(_ sender: UIButton){
        
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
