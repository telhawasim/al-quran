//
//  CustomSurahDetailView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import SwiftUI

struct CustomSurahDetailView: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var english: String = ""
    var arabic: String = ""
    var count: Int = 0
    var isPlaying: Bool = false
    var onPressPlay: (() -> Void)?
    var onPressBookmark: (() -> Void)?
    
    //MARK: - VIEWS -
    var body: some View {
        VStack (spacing: 16) {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 27, height: 27)
                        .foregroundStyle(ColorEnum.color_863ED5.getColor)
                    Text("\(self.count)")
                        .font(.getSemibold())
                        .foregroundStyle(Color.white)
                }
                Spacer()
                HStack (spacing: 15) {
                    Button(action: {
                        self.onPressPlay?()
                    }, label: {
                        Image(self.isPlaying ? ImageEnum.icPause.rawValue : ImageEnum.icPlay.rawValue)
                            .resizable()
                            .foregroundStyle(ColorEnum.color_863ED5.getColor)
                            .frame(width: 15, height: 15)
                    })
                    .frame(width: 24, height: 24)
                    Button(action: {
                        self.onPressBookmark?()
                    }, label: {
                        Image(ImageEnum.icSurahBookmark.rawValue)
                            .resizable()
                            .frame(width: 24, height: 24)
                    })
                    .frame(width: 24, height: 24)
                }
            }
            .frame(height: 47)
            .padding(.horizontal, 13)
            .background(ColorEnum.color_121931.getColor.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))

            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Text(self.arabic)
                        .font(.getBold(20.0))
                        .foregroundStyle(ColorEnum.color_240F4F.getColor)
                        .multilineTextAlignment(.trailing)
                }
                Text(self.english)
                    .font(.getRegular())
                    .foregroundStyle(ColorEnum.color_240F4F.getColor)
                    .lineLimit(nil)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(ColorEnum.color_8789A3.getColor.opacity(0.39))
        }
    }
}

#Preview {
    CustomSurahDetailView()
}
