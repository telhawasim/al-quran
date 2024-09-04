//
//  TabbarView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI

struct TabbarView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State var selectedIndex: Int = 0
    @State var showSidebar: Bool = false
    //Binding
    @Binding var navigationPath: [Screen]
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            TabView(selection: self.$selectedIndex) {
                HomeView(sideBar: self.$showSidebar, navigationPath: self.$navigationPath)
                    .tabItem {
                        Image(ImageEnum.icHome.rawValue)
                            .renderingMode(.template)
                    }
                    .tag(0)
                Text("Profile view")
                    .navigationTitle("Profile")
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(1)
                BookmarkView()
                    .tabItem {
                        Image(ImageEnum.icBookmark.rawValue)
                            .renderingMode(.template)
                    }
                    .tag(2)
            }
            .tint(ColorEnum.color_672CBC.getColor)
            SidebarView(showSideBar: self.$showSidebar, navigationPath: self.$navigationPath)
        }
    }
}

#Preview {
    TabbarView(
        navigationPath: Binding.constant([])
    )
}
