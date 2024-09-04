//
//  ErrorPopupView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct ErrorPopupView: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var message: String = ""
    //Binding
    @Binding var showPopup: Bool
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            } // Background
            .background(Color.black.opacity(0.3))
            VStack {
                VStack {
                    Text(StringConstants.error.rawValue)
                        .font(.getBold(22.0))
                        .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    Text(self.message)
                        .font(.getRegular(17.0))
                        .foregroundStyle(ColorEnum.color_672CBC.getColor)
                        .multilineTextAlignment(.center)
                } // Title and message
                .padding(.horizontal, 14)
                .padding(.top, 10)
                Button(action: {
                    self.showPopup = false
                }, label: {
                    Text(StringConstants.ok.rawValue)
                        .font(.getSemibold(18.0))
                        .foregroundStyle(ColorEnum.color_672CBC.getColor)
                        .frame(maxWidth: .infinity, minHeight: 55)
                        .background(ColorEnum.color_672CBC.getColor.opacity(0.07))
                })
            }
            .frame(width: UIScreen.main.bounds.width - 60)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
        .opacity(self.showPopup ? 1.0 : 0)
        .animation(.default, value: self.showPopup)
    }
}

#Preview {
    ErrorPopupView(
        showPopup: Binding.constant(true)
    )
}
