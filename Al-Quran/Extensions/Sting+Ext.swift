//
//  Sting+Ext.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import Foundation

extension String {
    
    //MARK: - IS VALID EMAIL -
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
