//
//  SignInView.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import SwiftUI

struct SignInView: View {
    @State var viewModel = SingInViewModel()
    var body: some View {
        VStack {
            Image("travel-Imge")
                .resizable()
                .scaledToFill()
                .overlay {
                    LinearGradient(gradient: Gradient(colors: [Color("AppColor"), .clear]), startPoint: .bottom, endPoint: .top)
                }
                .frame(height: 400)
            Spacer()
            VStack{
                SingInEmailTextField(placeHolder: "Email Adress", text: $viewModel.email)
                SingInPasswordTextField(placeHolder: "PassWord", showPassWord: $viewModel.showPassWord, text: $viewModel.password)
                    .padding(.bottom)
                Button {
                    viewModel.signInWithEmail()
                } label: {
                    Text("Sing In")
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("AppColor"))
                        }
                }
                
            }
            .padding()
            Spacer()
            VStack(spacing: 24) {
                Text("Don't Have an account yet?")
                    .foregroundStyle(Color("AppColor"))
                Button {
                    viewModel.showRegistration = true
                } label: {
                    Text("Register")
                        .bold()
                        .foregroundStyle(Color("AppColor"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background (
                            RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("AppColor"))
                        )
                }
                
            }
            .padding()
            .padding(.bottom)
            
        }
        .frame(maxHeight: .infinity,  alignment: .top)
        .ignoresSafeArea()
        .sheet(isPresented: $viewModel.showRegistration) {
            RegisterView()
                .presentationDetents([.fraction(0.5)])
        }
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
    SignInView()
}
