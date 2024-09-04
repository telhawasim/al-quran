//
//  CustomHomeSurah.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import SwiftUI

struct CustomHomeSurah: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var surah: SurahResponseModel?
    var count: Int = 0
    var onPress: (() -> Void)?
    
    //MARK: - VIEWS -
    var body: some View {
        Button(action: {
            self.onPress?()
        }, label: {
            VStack (spacing: 0) {
                HStack (spacing: 16) {
                    ZStack {
                        Image(ImageEnum.icHomeDesign.rawValue)
                        Text("\(self.self.count)")
                            .font(.getSemibold())
                            .foregroundStyle(ColorEnum.color_240F4F.getColor)
                    } // Design and Number
                    VStack (alignment: .leading, spacing: 0) {
                        Text(self.surah?.surahName ?? "")
                            .font(.getSemibold(16.0))
                            .foregroundStyle(ColorEnum.color_240F4F.getColor)
                        HStack (spacing: 5) {
                            Text(self.surah?.revelationPlace?.rawValue.uppercased() ?? "")
                                .font(.getSemibold(13.0))
                                .foregroundStyle(ColorEnum.color_8789A3.getColor)
                            Circle()
                                .frame(width: 4, height: 4)
                                .foregroundStyle(ColorEnum.color_8789A3.getColor.opacity(0.4))
                            Text("\(self.surah?.totalAyah ?? 0)" + " VERSES")
                                .font(.getSemibold(13.0))
                                .foregroundStyle(ColorEnum.color_8789A3.getColor)
                        }
                    }
                    Spacer()
                    Text(self.surah?.surahNameArabic ?? "")
                        .font(.getAmiriBold(20.0))
                        .foregroundStyle(ColorEnum.color_863ED5.getColor)
                }
                .padding(.vertical, 21)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(ColorEnum.color_8789A3.getColor.opacity(0.35))
            }
        })
    }
}

#Preview {
    CustomHomeSurah()
}
