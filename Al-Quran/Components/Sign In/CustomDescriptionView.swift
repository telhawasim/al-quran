//
//  CustomDescriptionView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct CustomDescriptionView: View {
    
    //MARK: - VARIABLES -
    var title: String
    
    //MARK: - VIEWS -
    var body: some View {
        Text(self.title)
            .font(.getRegular(17.0))
            .foregroundStyle(ColorEnum.color_672CBC.getColor)
    }
}

#Preview {
    CustomDescriptionView(
        title: "Already have an acoount? Sign in to continue"
    )
}
