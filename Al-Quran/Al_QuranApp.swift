//
//  Al_QuranApp.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI
import SwiftData

@main
struct Al_QuranApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: UserModel.self)
    }
}
