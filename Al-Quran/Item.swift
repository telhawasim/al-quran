//
//  Item.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
