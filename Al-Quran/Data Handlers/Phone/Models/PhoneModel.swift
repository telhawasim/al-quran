//
//  PhoneModel.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import Foundation

struct Country: Codable, Identifiable {
    let id: String
    let name: String
    let flag: String
    let code: String
    let dial_code: String
    let pattern: String
    let limit: Int
    
    static let allCountry: [Country] = Bundle.main.decode("CountryNumbers.json")
    static let example = allCountry[0]
}
