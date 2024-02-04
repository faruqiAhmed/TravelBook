//
//  PasswordTextField.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//

import SwiftUI

struct PasswordTextField: View {
    var placeHolder: String
   @Binding var showPassWord: Bool
    @Binding var text: String
    var body: some View {
        if showPassWord {
          SingInEmailTextField(placeHolder: "PassWord", text: $text)
                .overlay(alignment:.trailing) {
                    Button(role: .cancel) {
                        withAnimation(.snappy) {
                            showPassWord = false
                        }
                       
                    } label: {
                        Image(systemName: "eye")
                            .padding()
                            .contentTransition(.symbolEffect)
                    }
                }

        } else {
            SecureField("Password", text: $text)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding()
                .foregroundStyle(.primary)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                        .stroke(Color("AppColor"), style: StrokeStyle(lineWidth: 1))
               }
                .overlay(alignment:.trailing) {
                    Button(role: .cancel) {
                        showPassWord = true
                    } label: {
                        Image(systemName: "eye.slash")
                            .padding()
                            .contentTransition(.symbolEffect)
                    }
                }
        }
              
    }
}

#Preview {
    PasswordTextField(placeHolder: "PassWord", showPassWord: .constant(true),  text: .constant(""))
}
