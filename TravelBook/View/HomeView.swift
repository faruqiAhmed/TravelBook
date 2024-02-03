//
//  HomeView.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Button(role: .destructive) {
                do {
                    try AuthService.shared.signOut()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("SingOut")
                
            }

        }
        .padding()
    }
    }

#Preview {
    HomeView()
}
