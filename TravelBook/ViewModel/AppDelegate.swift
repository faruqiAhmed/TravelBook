//
//  AppDelegate.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//


import UIKit
import GoogleMaps

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
   //     GMSServices.provideAPIKey("AIzaSyDFjovP0rltMhlWFoXVNY9p-9HOJ1_-3VU")
        GMSServices.provideAPIKey("AIzaSyAA7ZvaR0YCq4zDVd0IRNA079q3EMY-f94")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
      }
}
