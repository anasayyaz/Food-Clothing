//
//  FoodTestViewController.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 25/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit


class RestaurantLocation: NSObject {
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
    }

}


class FoodTestViewController: UIViewController {
    
    
    var mapView: GMSMapView?
    
    var currentDestination: RestaurantLocation?
    
    let destinations = [RestaurantLocation(name: "University of Central Punjab, Avenue 1، Khayaban-e-Jinnah, Lahore", location: CLLocationCoordinate2D( latitude: 31.447193, longitude: 74.268296), zoom: 15), RestaurantLocation(name: "HOT AND SPICY", location: CLLocationCoordinate2DMake(31.446482, 74.268521), zoom: 18)]
    
    
    
    
    //31.446482, 74.268521
    override func viewDidLoad() {
        super.viewDidLoad()


        GMSServices.provideAPIKey("AIzaSyCHs0rP-mJDamBEU22fKelgDsoIIEi9k5I")
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 31.447193, longitude: 74.268296, zoom: 12)
        
        let mapView = GMSMapView.map(withFrame: CGRect.zero , camera: camera)
        view = mapView
        
        
        
        let currentLocation = CLLocationCoordinate2DMake(31.447193, 74.268296)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "University of Central Punjab, Avenue 1، Khayaban-e-Jinnah, Lahore"
        marker.map = mapView
        


        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Next",
            style: .plain,
            target: self,
            action: #selector(nextLocation))

        // Do any additional setup after loading the view.
    }
    
    @objc func nextLocation() {
        
        
        if currentDestination == nil{
            currentDestination = destinations.first
            mapView?.camera = GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom)
            
            let marker = GMSMarker(position: currentDestination!.location)
            marker.title = currentDestination?.name
           
            marker.map = mapView
        }
        else{
            if   let index = destinations.index(of: currentDestination!), index < destinations.count - 1 {
                currentDestination = destinations[index + 1]
                 mapView?.camera = GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom)
                 
                 let marker = GMSMarker(position: currentDestination!.location)
                 marker.title = currentDestination?.name
                
                 marker.map = mapView

                
            }
        }
    
    setMapCamera()
    }
    
  
    //  31.444816   74.268166  private func setMapCamera() {
    
    private func setMapCamera() {
        CATransaction.begin()
        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
        mapView?.animate(to: GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom))

        CATransaction.commit()
        let marker = GMSMarker(position: currentDestination!.location)
        marker.title = currentDestination?.name
        marker.map = mapView

    }

    /* My incorrect code */

    @objc func lastLocation() {

        if currentDestination == destinations.last {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "Finish",
                style: .plain,
                target: "myItinerary",
                action: #selector(lastLocation)
            )
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
}

