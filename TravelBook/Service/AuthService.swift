//
//  AuthService.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import Foundation
import FirebaseAuth

final class AuthService {
   private let auth = Auth.auth()
   static  let shared = AuthService()
    private init () {
        
    }
    func registerWithEmail(email: String, password: String) async throws {
        let result = try await auth.createUser(withEmail: email, password: password)
        print(result.user)
    }

    func signInWithEmail(email: String, password: String) async throws {
  let result =    try await  auth.signIn(withEmail: email, password: password)
        print(result.user)
    }
}
