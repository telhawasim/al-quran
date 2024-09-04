//
//  SurahDetailResponseModel.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import Foundation

//MARK: - SurahDetailResponseModel -
struct SurahDetailResponseModel: Codable {
    var surahName: String?
    var surahNameArabic: String?
    var surahNameArabicLong: String?
    var surahNameTranslation: String?
    var revelationPlace: String?
    var totalAyah: Int?
    var surahNo: Int?
    var english: [String]?
    var arabic1: [String]?
    var arabic2: [String]?
}
