//
//  AppDelegate.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 08/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import Moya





@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 
    let window = UIWindow()
    let locationService = LocationService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let service = MoyaProvider<YelpService.BusinessesProvider>()
    let jsonDecoder = JSONDecoder()
    
    
    
    
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

           jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
           
        
        switch locationService.status {
        case .notDetermined, .denied, .restricted:
            let locationViewController = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
            locationViewController?.locationService = locationService
 
            window.rootViewController = locationViewController
        default:
              let nav = storyboard
                         .instantiateViewController(withIdentifier: "RestaurantNavigationController") as? UINavigationController
                     window.rootViewController = nav
                     loadBusinesses()
                 }
                 window.makeKeyAndVisible()
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }



private func loadBusinesses() {
        service.request(.search(lat: 42.361145, long: -71.057083)) { (result) in
            switch result {
            case .success(let response):
                let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                let viewModels = root?.businesses.compactMap(RestaurantListViewModel.init)
                if let nav = self.window.rootViewController as? UINavigationController,
                    let restaurantListViewController = nav.topViewController as? RestaurantTableViewController {
                    restaurantListViewController.viewModels = viewModels ?? []
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

}
