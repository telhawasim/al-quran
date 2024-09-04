//
//  CustomBackButton.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct CustomBackButton: View {
    
    //MARK: - VARIABLES -
    var image: String = ImageEnum.icBack.rawValue
    var onPress: (() -> Void)?
    
    //MARK: - VIEWS -
    var body: some View {
        Button(action: {
            self.onPress?()
        }, label: {
            ZStack {
                Image(self.image)
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
            }
            .frame(width: 56, height: 56)
            .background(ColorEnum.color_672CBC.getColor.opacity(0.07))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(ColorEnum.color_672CBC.getColor.opacity(0.12), lineWidth: 2.0)
            )
        })
    }
}

#Preview {
    CustomBackButton()
}
