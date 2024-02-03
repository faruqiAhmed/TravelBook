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
            
             Spacer()
            Button(role: .destructive) {
                do {
                    try AuthService.shared.signOut()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("SingOut")
                    .bold()
                    .foregroundStyle(Color("AppColor"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("AppColor"))
                    }
            }
           
        }
        .padding()
        .padding(.bottom)
    }
    }

#Preview {
    HomeView()
}
