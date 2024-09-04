//
//  SurahDetailsView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import SwiftUI

struct SurahDetailsView: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var id: Int
    //Binding
    @Binding var navigationPath: [Screen]
    //StateObject
    @StateObject private var viewModel = SurahDetailVM()
    
    //MARK: - VIEWS -
    var body: some View {
        VStack (spacing: 0) {
            HStack (spacing: 24) {
                Button(action: {
                    Routing.shared.popToView(views: &self.navigationPath)
                }, label: {
                    Image(ImageEnum.icBack.rawValue)
                }) // Back Button
                Text(self.viewModel.model?.surahName ?? "")
                    .font(.getBold(20.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
                Spacer()
            } // Back Button
            ZStack {
                Image(ImageEnum.icSurahDetailBg.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack (spacing: 16) {
                    VStack (spacing: 0) {
                        Text(self.viewModel.model?.surahName ?? "")
                            .font(.getSemibold(26.0))
                            .foregroundStyle(Color.white)
                        Text(self.viewModel.model?.surahNameTranslation ?? "")
                            .font(.getSemibold(16.0))
                            .foregroundStyle(Color.white)
                    } // Title and Meaning
                    Rectangle()
                        .frame(width: 200, height: 1)
                    .foregroundStyle(Color.white.opacity(0.39))
                    HStack (spacing: 5) {
                        Text(self.viewModel.model?.revelationPlace ?? "")
                            .font(.getSemibold())
                            .foregroundStyle(Color.white)
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundStyle(Color.white.opacity(0.39))
                        Text("\(self.viewModel.model?.totalAyah ?? 0) VERSES")
                            .font(.getSemibold())
                            .foregroundStyle(Color.white)
                    } // Origin and Number of verses
                    Image(ImageEnum.icBismillah.rawValue)
                        .padding(.top, 16)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 50, height: 257)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .shadow(color: ColorEnum.color_672CBC.getColor, radius: 5, y: 3)
            .padding(.top, 24)
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { proxy in
                    LazyVStack(spacing: 24) {
                        ForEach(0..<(self.viewModel.model?.english?.count ?? 0), id: \.self) { index in
                            CustomSurahDetailView(
                                english: self.viewModel.model?.english?[index] ?? "",
                                arabic: self.viewModel.model?.arabic1?[index] ?? "",
                                count: index + 1,
                                isPlaying: self.viewModel.currentPlayingIndex == index,
                                onPressPlay: {
                                    if self.viewModel.isPlaying {
                                        self.viewModel.stopAudio()
                                    } else {
                                        let url = "https://quranaudio.pages.dev/1/\(id)_\(index + 1).mp3"
                                        self.viewModel.playAudio(from: url, index: index)
                                    }
                                },
                                onPressBookmark: {
                                    // Handle bookmark press
                                }
                            )
                            .id(index)
                        }
                    }
                    .onChange(of: self.viewModel.currentPlayingIndex) { (oldValue, newValue) in
                        if newValue != -1 {
                            withAnimation {
                                proxy.scrollTo(newValue, anchor: .center)
                            }
                        }
                    }
                }
            }
            .padding(.top, 32)
        }
        .padding(.horizontal, 25)
        .animation(.default, value: self.viewModel.model != nil)
        .onAppear {
            self.viewModel.getSurahDetailAPI(id: "\(self.id)")
        }
    }
}

#Preview {
    SurahDetailsView(
        id: 0,
        navigationPath: Binding.constant([])
    )
}
