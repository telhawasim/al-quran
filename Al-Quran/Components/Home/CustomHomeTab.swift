//
//  CustomHomeTab.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import SwiftUI

struct CustomHomeTab: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var title: String = ""
    var isSelected: Bool = false
    
    //MARK: - VIEWS -
    var body: some View {
        VStack (spacing: 0) {
            Text(self.title)
                .font(.getSemibold(18.0))
                .foregroundStyle(self.isSelected ? ColorEnum.color_672CBC.getColor : ColorEnum.color_8789A3.getColor)
                .padding(.vertical, 10)
            ZStack {
                
            }
            .frame(maxWidth: .infinity, minHeight: 3.0)
            .background(ColorEnum.color_8789A3.getColor.opacity(0.1))
        }
    }
}

#Preview {
    CustomHomeTab()
}
