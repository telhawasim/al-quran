//
//  SidebarView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 03/09/2024.
//

import SwiftUI
import SwiftData

struct SidebarView: View {
    
    //MARK: - VARIABLES -
    
    //Binding
    @Binding var showSideBar: Bool
    @Binding var navigationPath: [Screen]
    //Environment
    @Environment(\.modelContext) var context
    //Query
    @Query private var users: [UserModel]
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack (alignment: .leading) {
            GeometryReader { _ in
                EmptyView()
            } // Background
            .background(self.showSideBar ? Color.black.opacity(0.35) : Color.clear)
            .opacity(self.showSideBar ? 1 : 0)
            .onTapGesture {
                self.showSideBar = false
            }
            VStack {
                VStack {
                    Image(ImageEnum.icPlaceholder.rawValue)
                        .resizable()
                        .frame(width: 70, height: 70)
                    Text("Telha Wasim")
                    Text(verbatim: "telhawasim@gmail.com")
                }
                Spacer()
                VStack {
                    CustomLoginButton(
                        title: "Logout",
                        onPress: {
                            MyUserDefaults.user = nil
                            Routing.shared.setRootView(views: &self.navigationPath)
                        }
                    )
                    CustomLoginButton(
                        title: "Delete Account",
                        onPress: {
                            self.deleteAccount()
                        }
                    )
                }
                .padding(.horizontal, 25)
            }
            .frame(width: UIScreen.main.bounds.width * 0.7)
            .background(Color.white)
            .offset(x: self.showSideBar ? 0 : -320)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width < -50 {
                            self.showSideBar = false
                        }
                    })
            )
        }
        .animation(.default, value: self.showSideBar)
    }
    
    //MARK: - DELETE ACCOUNT -
    private func deleteAccount() {
        if let existingUser = self.users.first(where: { $0.email == MyUserDefaults.user?.email }) {
            self.context.delete(existingUser)
            MyUserDefaults.user = nil
            Routing.shared.setRootView(views: &self.navigationPath)
        }
    }
}

#Preview {
    SidebarView(
        showSideBar: Binding.constant(true),
        navigationPath: Binding.constant([])
    )
}
