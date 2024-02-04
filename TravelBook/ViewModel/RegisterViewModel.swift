//
//  RegisterViewModel.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//

import Foundation
@Observable
class RegisterViewModel {
      var email = ""
      var password = ""
      var passwordCheck = ""
      var showPassWord = false
      var  showpasswordCheck = false
      var showError = false
      var localizedError: String = "There was an issue creating your account. Please try again."
    func validateform()  throws {
        if !email.isValidEmail(){
            throw AppAuthError.invalidEmail
        } else if password.count < 8 && passwordCheck.count < 8 {
            throw AppAuthError.inValidPasswordLength
        } else if password != passwordCheck {
            throw AppAuthError.passWordDoNotMatch
        }
    }
    func registerWithEmail() {
        Task {
            do {
                 try validateform()
                try await AuthService.shared.registerWithEmail(email: email, password: password)
                
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


