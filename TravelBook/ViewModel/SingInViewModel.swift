//
//  SingInViewModel.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//


import Observation
import FirebaseAuth

 @Observable
class SingInViewModel {
    var email = ""
    var password = ""
    var showPassWord = false
    
    func signInWithEmail() {
        Task {
            do {
                try await AuthService.shared.signInWithEmail(email: email, password: password)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
