//
//  Routing.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import Foundation

//MARK: - SCREEN -
enum Screen: Hashable {
    case boarding
    case signIn
    case register
    case name(user: UserModel)
    case tabbar
    case surahDetail(id: Int)
    
    static func ==(lhs: Screen, rhs: Screen) -> Bool {
        switch (lhs, rhs) {
        case (.boarding, .boarding),
            (.signIn, .signIn),
            (.tabbar, .tabbar):
            return true
        case (.surahDetail(let id1), .surahDetail(let id2)):
            return id1 == id2
        default:
            return false
        }
    }
}

class Routing {
    
    //MARK: - VARIABLES -
    static let shared = Routing()
    private init() {}
    
    //MARK: - NAVIGATE TO VIEW -
    func navigateToView(views: inout [Screen], view: Screen) {
        views.append(view)
    }
    
    //MARK: - POP TO VIEW -
    func popToView(views: inout [Screen]) {
        views.removeLast()
    }
    
    //MARK: - POP TO SPECIFIC VIEW -
    func popToSpecificView(views: inout [Screen], screen: Screen) {
        if views.contains(where: { $0 == screen }) {
            while let lastView = views.last {
                if lastView == screen {
                    break
                } else {
                    views.removeLast()
                }
            }
        } else {
            views.append(screen)
        }
    }
    
    //MARK: - SET ROOT VIEW -
    func setRootView(views: inout [Screen]) {
        var rootView: [Screen] = []
        rootView.append(.boarding)
        rootView.append(.signIn)
        
        views = rootView
    }
}
