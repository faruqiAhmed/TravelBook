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
                .frame(height: 200)
                Spacer()
            VStack{
                SingInEmailTextField(placeHolder: "Email Adress", text: $viewModel.email)
                SingInPasswordTextField(placeHolder: "PassWord", showPassWord: $viewModel.showPassWord, text: $viewModel.password)
                    .padding(.bottom)
                Button {
                    
                } label: {
                   Text("Sing In")
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                     //   .frame(width: 150, height: 55)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("AppColor"))
                            
                        }
                }

            }
            .padding()
            Spacer()
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .top)
        .padding(.top,48)
         
    }
        
}

#Preview {
    SignInView()
}
