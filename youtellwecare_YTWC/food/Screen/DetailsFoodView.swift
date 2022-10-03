 //
//  DetailsFoodView.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 12/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit
import MapKit

@IBDesignable class DetailsFoodView: BaseView{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func handleConntrol(_ sender: UIPageControl){
        
    }
                                              
}


