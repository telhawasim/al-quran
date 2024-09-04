//
//  UserModel.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import Foundation
import SwiftData

@Model
class UserModel: Identifiable, Codable {
    var id: String?
    @Attribute(.unique) var email: String?
    var password: String?
    var phone: String?
    var firstName: String?
    var lastName: String?
    
    init(email: String? = nil, password: String? = nil, phone: String? = nil, firstName: String? = nil, lastName: String? = nil) {
        self.id = UUID().uuidString
        self.email = email
        self.password = password
        self.phone = phone
        self.firstName = firstName
        self.lastName = lastName
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, email, password, phone, firstName, lastName
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String?.self, forKey: .id)
        self.email = try container.decode(String?.self, forKey: .email)
        self.password = try container.decode(String?.self, forKey: .password)
        self.phone = try container.decode(String?.self, forKey: .phone)
        self.firstName = try container.decode(String?.self, forKey: .firstName)
        self.lastName = try container.decode(String?.self, forKey: .lastName)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(phone, forKey: .phone)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
    }
}
