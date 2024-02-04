//
//  RegisterView.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel = RegisterViewModel()
    var body: some View {
        VStack{
            HStack {
                Text("Register Now!")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                Button(role: .cancel) {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(Color(uiColor: .label))
                }
               
            }
            EmailTextField(placeHolder: "Enter Email", text: $viewModel.email)
            PasswordTextField(placeHolder: "password", showPassWord: $viewModel.showPassWord, text: $viewModel.password)
            PasswordTextField(placeHolder: " Conform password", showPassWord: $viewModel.showpasswordCheck, text: $viewModel.passwordCheck)
            
            Button{
                viewModel.registerWithEmail()
            } label: {
                Text("Register")
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background (
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("AppColor"))
                    )
            }
        }
       .padding()
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(.white)
       .alert("oops", isPresented: $viewModel.showError) {
           Button {
               viewModel.showError = false
           } label: {
               Text("ok")
           }

       } message: {
           Text(viewModel.localizedError)
       }
    }
}

#Preview {
    RegisterView()
}
