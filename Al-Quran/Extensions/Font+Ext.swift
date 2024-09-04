//
//  Font+Ext.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import Foundation
import SwiftUI

extension Font {
    
    //MARK: - GET REGULAR -
    static func getRegular(_ size: CGFloat = 14.0) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
    
    //MARK: - GET SEMIBOLD -
    static func getSemibold(_ size: CGFloat = 14.0) -> Font {
        return Font.custom("Poppins-SemiBold", size: size)
    }
    
    //MARK: - GET BOLD -
    static func getBold(_ size: CGFloat = 14.0) -> Font {
        return Font.custom("Poppins-Bold", size: size)
    }
    
    //MARK: - GET AMIRI BOLD - 
    static func getAmiriBold(_ size: CGFloat = 14.0) -> Font {
        return Font.custom("Amiri-Bold", size: size)
    }
}
