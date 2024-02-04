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
    var showRegistration = false
    var invaidPassword = false
    var showError = false
    var localizedError: String = " There is a issue . Please Try Aging"
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
                
            } catch let error as AppAuthError {
                showError = true
                localizedError = error.localizedDescription
                print(error.localizedDescription)
            } catch {
                showError = true
                print(error.localizedDescription)
            }
        }
    }
    
}
