//
//  CustomNameTextfield.swift
//  Al-Quran
//
//  Created by Telha Wasim on 04/09/2024.
//

import SwiftUI

struct CustomNameTextfield: View {
    
    //MARK: - VARIABLES -
    
    //Binding
    @Binding var value: String
    //Normal
    var placeholder: String = ""
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            TextField(text: self.$value, label: {
                Text(self.placeholder)
                    .font(.getRegular(16.0))
                    .foregroundStyle(ColorEnum.color_863ED5.getColor.opacity(0.39))
            })
            .font(.getRegular(16.0))
            .foregroundStyle(ColorEnum.color_863ED5.getColor)
            .padding(.horizontal, 27)
        }
        .frame(maxWidth: .infinity, minHeight: 56)
        .background(ColorEnum.color_863ED5.getColor.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 78.0))
        .overlay(
            RoundedRectangle(cornerRadius: 78.0)
                .stroke(ColorEnum.color_863ED5.getColor.opacity(0.12), lineWidth: 2.0)
        )
    }
}

#Preview {
    CustomNameTextfield(
        value: Binding.constant("")
    )
}
