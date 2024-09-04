//
//  ContentView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State var navigationPath: [Screen] = []
    
    //MARK: - VIEWS -
    var body: some View {
        NavigationStack (path: self.$navigationPath) {
            EmptyView()
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .boarding:
                        BoardingView(navigationPath: self.$navigationPath)
                            .navigationBarBackButtonHidden()
                    case .signIn:
                        SignInView(navigationPath: self.$navigationPath)
                            .navigationBarBackButtonHidden()
                    case .register:
                        RegisterView(navigationPath: self.$navigationPath)
                            .navigationBarBackButtonHidden()
                    case .tabbar:
                        TabbarView(navigationPath: self.$navigationPath)
                            .navigationBarBackButtonHidden()
                    case .surahDetail(let id):
                        SurahDetailsView(id: id, navigationPath: self.$navigationPath)
                            .navigationBarBackButtonHidden()
                    case .name(let user):
                        NameView(user: user, navigationPath: self.$navigationPath)
                            .navigationBarBackButtonHidden()
                    }
                }
        }
        .onAppear {
            if (MyUserDefaults.user == nil) {
                Routing.shared.navigateToView(views: &self.navigationPath, view: .boarding)
            } else {
                Routing.shared.navigateToView(views: &self.navigationPath, view: .tabbar)
            }
        }
    }
}

#Preview {
    ContentView()
}
