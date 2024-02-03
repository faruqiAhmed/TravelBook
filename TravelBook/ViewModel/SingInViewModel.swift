//
//  SingInViewModel.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//


import Observation
import FirebaseAuth
enum  AppAuthError: Error {
    case invalidEmail
    case inValidPasswordLength
}
 @Observable
class SingInViewModel {
    var email = ""
    var password = ""
    var showPassWord = false
    var showRegistration = false
    
    func validateform()  throws {
        if !email.isValidEmail(){
            throw AppAuthError.invalidEmail
        } else if password.count < 8 {
            throw AppAuthError.inValidPasswordLength
        }
    }
    func signInWithEmail() {
        Task {
            do {
                 try validateform()
                try await AuthService.shared.signInWithEmail(email: email, password: password)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
