//
//  MyUserDefaults.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import Foundation

class MyUserDefaults {
    
    //MARK: - ENUM KEYS -
    private enum Keys {
        static let userModel = "user_model"
    }
    
    //MARK: - USER -
    static var user: UserModel? {
        get {
            if let data = UserDefaults.standard.data(forKey: Keys.userModel) {
                return try? JSONDecoder().decode(UserModel.self, from: data)
            }
            return nil
        }
        set {
            if let newValue = newValue {
                let data = try? JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: Keys.userModel)
            } else {
                UserDefaults.standard.removeObject(forKey: Keys.userModel)
            }
        }
    }
}
