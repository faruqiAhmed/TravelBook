//
//  AuthService.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import Foundation
import FirebaseAuth
enum  AppAuthError: Error {
    case invalidEmail
    case emailAlreadyInUse
    case invalidPassWord
    case inValidPasswordLength
    case passWordDoNotMatch
    case networkError
    var localizedDescription: String {
        switch self {
        case .invalidEmail:
            "Please Enter a Valid  Email Adress."
        case .inValidPasswordLength:
            " Please make sure password is longer than 8 characters."
        case .passWordDoNotMatch:
            "Passwords do not match."
        case .emailAlreadyInUse:
            "This e-mail address is already in use. Please sign in or use different e-mail address."
        case .networkError:
            "There was an issue with the network concation Please try aging"
        case .invalidPassWord:
            "Password was incorrect. Please try again with the correct password."
        }
        
    }
    
}
@Observable
final class AuthService {
    var currentUser: FirebaseAuth.User?
   private let auth = Auth.auth()
   static  let shared = AuthService()
    private init () {
        currentUser = auth.currentUser
    }
    func registerWithEmail(email: String, password: String) async throws {
        do {
            let result = try await auth.createUser(withEmail: email, password: password)
            currentUser = result.user
        } catch {
            let error = error as NSError
            switch error.code {
            case AuthErrorCode.emailAlreadyInUse.rawValue:
             throw   AppAuthError.emailAlreadyInUse
            case AuthErrorCode.invalidEmail.rawValue:
              throw  AppAuthError.invalidEmail
            case AuthErrorCode.wrongPassword.rawValue:
                throw AppAuthError.invalidPassWord
            case AuthErrorCode.tooManyRequests.rawValue:
                throw  AppAuthError.networkError
            case AuthErrorCode.networkError.rawValue:
                throw  AppAuthError.networkError
             default:
                throw  AppAuthError.networkError
            }
        }
        
       
    }

func signInWithEmail(email: String, password: String) async throws {
    do {
        let result =    try await  auth.signIn(withEmail: email, password: password)
          currentUser =  result.user
    } catch {
        let error = error as NSError
        switch error.code {
        case AuthErrorCode.emailAlreadyInUse.rawValue:
         throw   AppAuthError.emailAlreadyInUse
        case AuthErrorCode.invalidEmail.rawValue:
          throw  AppAuthError.invalidEmail
        case AuthErrorCode.wrongPassword.rawValue:
            throw AppAuthError.invalidPassWord
        case AuthErrorCode.tooManyRequests.rawValue:
            throw  AppAuthError.networkError
        case AuthErrorCode.networkError.rawValue:
            throw  AppAuthError.networkError
         default:
            throw  AppAuthError.invalidPassWord
        }
    }

    }
    
    func signOut() throws {
        try auth.signOut()
        currentUser = nil
    }
    
    
}
