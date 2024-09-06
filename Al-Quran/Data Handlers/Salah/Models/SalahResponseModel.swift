//
//  SalahResponseModel.swift
//  Al-Quran
//
//  Created by Telha Wasim on 06/09/2024.
//

import Foundation

// MARK: - SalahResponseModel
struct SalahResponseModel: Codable {
    var code: Int?
    var status: String?
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var timings: Timings?
    var date: DateClass?
    var meta: Meta?
}

// MARK: - DateClass
struct DateClass: Codable {
    var readable, timestamp: String?
    var hijri: Hijri?
    var gregorian: Gregorian?
}

// MARK: - Gregorian
struct Gregorian: Codable {
    var date, format, day: String?
    var weekday: GregorianWeekday?
    var month: GregorianMonth?
    var year: String?
    var designation: Designation?
}

// MARK: - Designation
struct Designation: Codable {
    var abbreviated, expanded: String?
}

// MARK: - GregorianMonth
struct GregorianMonth: Codable {
    var number: Int?
    var en: String?
}

// MARK: - GregorianWeekday
struct GregorianWeekday: Codable {
    var en: String?
}

// MARK: - Hijri
struct Hijri: Codable {
    var date, format, day: String?
    var weekday: HijriWeekday?
    var month: HijriMonth?
    var year: String?
    var designation: Designation?
    var holidays: [String]?
}

// MARK: - HijriMonth
struct HijriMonth: Codable {
    var number: Int?
    var en, ar: String?
}

// MARK: - HijriWeekday
struct HijriWeekday: Codable {
    var en, ar: String?
}

// MARK: - Meta
struct Meta: Codable {
    var latitude, longitude: Double?
    var timezone: String?
    var method: Method?
    var latitudeAdjustmentMethod, midnightMode, school: String?
    var offset: [String: Int]?
}

// MARK: - Method
struct Method: Codable {
    var id: Int?
    var name: String?
    var params: Params?
    var location: Location?
}

// MARK: - Location
struct Location: Codable {
    var latitude, longitude: Double?
}

// MARK: - Params
struct Params: Codable {
    var fajr, isha: Int?

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case isha = "Isha"
    }
}

// MARK: - Timings
struct Timings: Codable {
    var fajr, sunrise, dhuhr, asr: String?
    var sunset, maghrib, isha, imsak: String?
    var midnight, firstthird, lastthird: String?

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case sunrise = "Sunrise"
        case dhuhr = "Dhuhr"
        case asr = "Asr"
        case sunset = "Sunset"
        case maghrib = "Maghrib"
        case isha = "Isha"
        case imsak = "Imsak"
        case midnight = "Midnight"
        case firstthird = "Firstthird"
        case lastthird = "Lastthird"
    }
}
