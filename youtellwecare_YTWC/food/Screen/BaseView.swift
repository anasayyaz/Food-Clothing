//
//  BaseView.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 12/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit


@IBDesignable class BaseView: UIView {
   
    override init (frame: CGRect){
        super.init(frame :frame)
        self.configure()
        
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
        
    }
    func configure(){
        
    }
    }
    

