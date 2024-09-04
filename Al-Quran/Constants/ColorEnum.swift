//
//  ColorEnum.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import Foundation
import SwiftUI

enum ColorEnum: String {
    case color_672CBC = "672CBC"
    case color_8789A3 = "8789A3"
    case color_F9B091 = "F9B091"
    case color_240F4F = "240F4F"
    case color_863ED5 = "863ED5"
    case color_121931 = "121931"
    
    //MARK: - GET COLOR -
    var getColor: Color {
        return Color(self.rawValue)
    }
}
