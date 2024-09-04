//
//  BoardingView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct BoardingView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State var showGetStartedButton: Bool = false
    //Binding
    @Binding var navigationPath: [Screen]
    
    //MARK: - VIEWS -
    var body: some View {
        VStack (spacing: 49) {
            VStack (spacing: 16) {
                Text(StringConstants.alQuran.rawValue)
                    .font(.getBold(28.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
                Text(StringConstants.learnQuranEveryDay.rawValue)
                    .font(.getRegular(18.0))
                    .foregroundStyle(ColorEnum.color_8789A3.getColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 70)
            } // Title and Description
            ZStack (alignment: .bottom) {
                Image(ImageEnum.icBgBoardidng.rawValue)
                Button(action: {
                    Routing.shared.navigateToView(views: &self.navigationPath, view: .signIn)
                }, label: {
                    Text(StringConstants.getStarted.rawValue)
                        .font(.getSemibold(18.0))
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 40)
                        .frame(height: 60)
                        .background(ColorEnum.color_F9B091.getColor)
                        .clipShape(RoundedRectangle(cornerRadius: 30.0))
                })
                .offset(y: 30)
            }
            .offset(y: self.showGetStartedButton ? 0 : 600)
            .animation(.bouncy.speed(0.6), value: self.showGetStartedButton)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                self.showGetStartedButton = true
            })
        }
    }
}

#Preview {
    BoardingView(
        navigationPath: Binding.constant([])
    )
}
