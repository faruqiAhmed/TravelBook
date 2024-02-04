//
//  TravelBookApp.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import SwiftUI
import FirebaseCore

@main
struct TravelBookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            if (AuthService.shared.currentUser != nil)  {
                HomeView()
            } else {
               SignInView()
            }
            }
                
    }
}
