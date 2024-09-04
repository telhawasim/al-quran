//
//  HomeView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State var selectedTab: Int = 0
    @Binding var sideBar: Bool
    //Normal
    var titles = ["Surah", "Para", "Page", "Hijb"]
    //StateObject
    @StateObject private var viewModel = HomeVM()
    //Binding
    @Binding var navigationPath: [Screen]
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 0) {
                HStack {
                    HStack (spacing: 24) {
                        Button(action: {
                            self.sideBar = true
                        }, label: {
                            Image(ImageEnum.icSidebar.rawValue)
                        })
                        Text("Al-Quran")
                            .font(.getBold(20.0))
                            .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    }
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(ImageEnum.icSearch.rawValue)
                    })
                } // Top View
                VStack (alignment: .leading, spacing: 4) {
                    Text("Asslamualaikum")
                        .font(.getSemibold(18.0))
                        .foregroundStyle(ColorEnum.color_8789A3.getColor)
                    Text("\(MyUserDefaults.user?.firstName ?? "") \(MyUserDefaults.user?.lastName ?? "")")
                        .font(.getSemibold(24.0))
                        .foregroundStyle(ColorEnum.color_240F4F.getColor)
                } // Name
                .padding(.top, 24)
                ZStack {
                    Image(ImageEnum.icHomeGradient.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    HStack {
                        VStack (alignment: .leading, spacing: 20) {
                            HStack (spacing: 8) {
                                Image(ImageEnum.icRead.rawValue)
                                Text("Last Read")
                                    .font(.getSemibold())
                                    .foregroundStyle(Color.white)
                            }
                            VStack (alignment: .leading, spacing: 4) {
                                Text("Al-Fatiah")
                                    .font(.getSemibold(18.0))
                                    .foregroundStyle(Color.white)
                                Text("Ayah No:1")
                                    .font(.getRegular())
                                    .foregroundStyle(Color.white)
                            }
                        }
                        .padding(.leading, 20)
                        Spacer()
                        Image(ImageEnum.icHomeQuran.rawValue)
                            .offset(y: 20)
                    }
                } // Gradient View
                .frame(width: UIScreen.main.bounds.width - 50, height: 131)
                .padding(.top, 24)
                HStack(spacing: 0) {
                    ForEach(0..<self.titles.count, id: \.self) { index in
                        CustomHomeTab(title: self.titles[index], isSelected: self.selectedTab == index)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    self.selectedTab = index
                                }
                            }
                    }
                }
                .overlay(
                    GeometryReader { geometry in
                        let tabWidth = geometry.size.width / 4
                        ColorEnum.color_672CBC.getColor
                            .frame(width: tabWidth, height: 3)
                            .offset(x: tabWidth * CGFloat(selectedTab))
                            .animation(.easeInOut, value: selectedTab)
                    }
                        .frame(height: 3), alignment: .bottom
                )
                .padding(.top, 24)
                ScrollView (.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(Array(self.viewModel.surahs?.enumerated() ?? [].enumerated()), id: \.element.surahName) { index, surah in
                            CustomHomeSurah(
                                surah: surah,
                                count: index + 1,
                                onPress: {
                                    let id = index + 1
                                    Routing.shared.navigateToView(views: &self.navigationPath, view: .surahDetail(id: id))
                                }
                            )
                        }
                    }
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 25)
        }
        .animation(.default, value: self.viewModel.surahs != nil)
        .onAppear {
            self.viewModel.getHomeAPI()
        }
    }
}

#Preview {
    HomeView(
        sideBar: Binding.constant(false),
        navigationPath: Binding.constant([])
    )
}
