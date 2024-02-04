//
//  AuthService.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import Foundation
import FirebaseAuth

@Observable
final class AuthService {
    var currentUser: FirebaseAuth.User?
   private let auth = Auth.auth()
   static  let shared = AuthService()
    private init () {
        currentUser = auth.currentUser
    }
    func registerWithEmail(email: String, password: String) async throws {
        let result = try await auth.createUser(withEmail: email, password: password)
        currentUser = result.user
       
    }

func signInWithEmail(email: String, password: String) async throws {
  let result =    try await  auth.signIn(withEmail: email, password: password)
    currentUser =  result.user
    }
    func signOut() throws {
        try auth.signOut()
        currentUser = nil
    }
    
    
}
