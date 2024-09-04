//
//  CustomTopBackView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct CustomTopBackView: View {
    
    //MARK: - VARIABLES -
    var onPress: (() -> Void)?
    
    //MARK: - VIEWS -
    var body: some View {
        HStack {
            CustomBackButton(
                onPress: {
                    self.onPress?()
                }
            )
            Spacer()
        }
    }
}

#Preview {
    CustomTopBackView()
}
