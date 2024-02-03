//
//  SingInEmailTextField
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import SwiftUI

struct SingInEmailTextField: View {
    var placeHolder: String
    @Binding var text: String
    var body: some View {
        TextField(placeHolder, text: $text)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding()
            .foregroundStyle(.primary)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .stroke(Color("AppColor"), style: StrokeStyle(lineWidth: 1))
            }
         //   .padding()
    }
}

#Preview {
    SingInEmailTextField(placeHolder: "Email Adress", text: .constant(""))
}
