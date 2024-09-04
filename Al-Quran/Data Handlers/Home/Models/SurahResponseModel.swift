//
//  SurahResponseModel.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import Foundation

//MARK: - SurahResponseModel -
struct SurahResponseModel: Codable {
    var surahName, surahNameArabic, surahNameArabicLong, surahNameTranslation: String?
    var revelationPlace: RevelationPlace?
    var totalAyah: Int?
}

//MARK: - RevelationPlace -
enum RevelationPlace: String, Codable {
    case madina = "Madina"
    case mecca = "Mecca"
}

typealias SurahList = [SurahResponseModel]
