//
//  AppDelegate.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//


import UIKit
import GoogleMaps
import CoreLocation
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var locationManager = CLLocationManager()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
   //     GMSServices.provideAPIKey("AIzaSyDFjovP0rltMhlWFoXVNY9p-9HOJ1_-3VU")
        GMSServices.provideAPIKey("AIzaSyAA7ZvaR0YCq4zDVd0IRNA079q3EMY-f94")
        let status: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
                if status == CLAuthorizationStatus.notDetermined || status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted
                {
                    locationManager.requestAlwaysAuthorization()
                }
        return true
    }
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
      }
}
