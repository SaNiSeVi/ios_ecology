//
//  AppDelegate.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
// VITYA_UPDATE
var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // main
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mapVC = MapViewController()
        let newsVC = NewsViewController()
        let profileVC = ProfileViewController()
        
        let tabBarController = UITabBarController()
        
        // settings controller
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "placeholder"), selectedImage: nil)
        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(named: "newspaper"), selectedImage: nil)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: nil)
        // visual contollers in tabbar
        tabBarController.viewControllers = [mapVC,newsVC,profileVC]
        // visual main
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        
      //  self.window?.
        return true
    }

    


}

