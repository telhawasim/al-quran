//
//  CustomTitleView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct CustomTitleView: View {
    
    //MARK: - VARIABLES -
    var title: String
    
    //MARK: - VIEWS -
    var body: some View {
        Text(self.title)
            .font(.getBold(43.0))
            .foregroundStyle(ColorEnum.color_672CBC.getColor)
    }
}

#Preview {
    CustomTitleView(
        title: "Sign In"
    )
}
