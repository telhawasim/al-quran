//
//  CustomSalahTime.swift
//  Al-Quran
//
//  Created by Telha Wasim on 06/09/2024.
//

import SwiftUI

struct CustomSalahTime: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var title: String = "Fajr"
    var time: String = "111"
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            HStack {
                Text(self.title)
                    .font(.getSemibold(18.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
                Spacer()
                Text(self.time)
                    .font(.getSemibold(18.0))
                    .foregroundStyle(ColorEnum.color_240F4F.getColor)
            }
            .padding(.horizontal, 25)
        }
        .frame(maxWidth: .infinity, minHeight: 70)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(Color.gray.opacity(0.2))
        )
    }
}

#Preview {
    CustomSalahTime()
}
