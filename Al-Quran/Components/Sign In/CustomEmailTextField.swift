//
//  CustomEmailTextField.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct CustomEmailTextField: View {
    
    //MARK: - VARIABLES -
    
    //Binding
    @Binding var email: String
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            TextField(text: self.$email, label: {
                Text(StringConstants.email.rawValue)
                    .font(.getRegular(16.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor.opacity(0.39))
            })
            .font(.getRegular(16.0))
            .foregroundStyle(ColorEnum.color_672CBC.getColor)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
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
    CustomEmailTextField(
        email: Binding.constant("")
    )
}
