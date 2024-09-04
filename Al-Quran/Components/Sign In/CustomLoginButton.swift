//
//  CustomLoginButton.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct CustomLoginButton: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var title: String = ""
    var onPress: (() -> Void)?
    
    //MARK: - VIEWS -
    var body: some View {
        Button(action: {
            self.onPress?()
        }, label: {
            Text(self.title)
                .font(.getSemibold(18.0))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(LinearGradient(colors: [
                    ColorEnum.color_672CBC.getColor,
                    ColorEnum.color_672CBC.getColor.opacity(0.5)
                ], startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 78.0))
        })
    }
}

#Preview {
    CustomLoginButton()
}
