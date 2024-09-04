//
//  CustomPasswordTextField.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct CustomPasswordTextField: View {
    
    //MARK: - VARIABLES -
    
    //Binding
    @Binding var password: String
    //State
    @State var showPassword: Bool = false
    //Normal
    var placeHolder: String = ""
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            HStack {
                if (self.showPassword) {
                    TextField(text: self.$password, label: {
                        Text(self.placeHolder)
                            .font(.getRegular(16.0))
                            .foregroundStyle(ColorEnum.color_672CBC.getColor.opacity(0.39))
                    })
                    .font(.getRegular(16.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
                } else {
                    SecureField(text: self.$password, label: {
                        Text(self.placeHolder)
                            .font(.getRegular(16.0))
                            .foregroundStyle(ColorEnum.color_672CBC.getColor.opacity(0.39))
                    })
                    .font(.getRegular(16.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
                }
                Spacer()
                Button(action: {
                    self.showPassword.toggle()
                }, label: {
                    VStack (spacing: -3) {
                        Text(self.showPassword ? StringConstants.hide.rawValue : StringConstants.show.rawValue)
                            .font(.getSemibold(16.0))
                            .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    }
                })
            }
            .padding(.horizontal, 27)
        }
        .frame(maxWidth: .infinity, minHeight: 56)
        .background(ColorEnum.color_672CBC.getColor.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 78.0))
        .overlay(
            RoundedRectangle(cornerRadius: 78.0)
                .stroke(ColorEnum.color_672CBC.getColor.opacity(0.12), lineWidth: 2.0)
        )
    }
}

#Preview {
    CustomPasswordTextField(
        password: Binding.constant("")
    )
}
