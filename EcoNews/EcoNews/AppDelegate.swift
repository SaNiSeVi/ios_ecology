//
//  AppDelegate.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // main
        FirebaseApp.configure()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let welcomeVC = WelcomePageViewController()
        // visual main
        self.window?.rootViewController = welcomeVC
        self.window?.makeKeyAndVisible()
        //  self.window?.
        return true
    }
}

