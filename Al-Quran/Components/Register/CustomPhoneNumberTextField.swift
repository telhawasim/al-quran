//
//  CustomPhoneNumberTextField.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import SwiftUI

struct CustomPhoneNumberTextField: View {
    
    //MARK: - VARIABLES -
    
    //Binding
    @Binding var countryFlag: String
    @Binding var countryCode: String
    @Binding var mobPhoneNumber: String
    @Binding var countryPattern: String
    @Binding var countryLimit: Int
    //FocusState
    @FocusState private var keyIsFocused: Bool
    //Normal
    var onPress: (() -> Void)?
    
    //MARK: - VIEWS -
    var body: some View {
        HStack (spacing: 13) {
            Button(action: {
                withAnimation (.bouncy.speed(0.6)) {
                    self.keyIsFocused = false
                    self.onPress?()
                }
            }, label: {
                ZStack {
                    Circle()
                        .foregroundStyle(ColorEnum.color_863ED5.getColor.opacity(0.07))
                        .overlay(
                            Circle()
                                .stroke(ColorEnum.color_863ED5.getColor.opacity(0.12), lineWidth: 2.0)
                        )
                    Text(self.countryFlag)
                }
                .frame(width: 56)
            })
            ZStack {
                HStack (spacing: 7) {
                    Text(self.countryCode)
                        .font(.getRegular(16.0))
                        .foregroundStyle(ColorEnum.color_863ED5.getColor)
                    TextField(text: self.$mobPhoneNumber, label: {
                        Text(self.countryPattern)
                            .font(.getRegular(16.0))
                            .foregroundStyle(ColorEnum.color_863ED5.getColor.opacity(0.39))
                    })
                    .font(.getRegular(16.0))
                    .foregroundStyle(ColorEnum.color_863ED5.getColor)
                    .focused(self.$keyIsFocused)
                    .keyboardType(.numberPad)
                    .onChange(of: self.mobPhoneNumber) { (oldValue, newValue) in
                        if (self.mobPhoneNumber.count > self.countryLimit) {
                            self.mobPhoneNumber = String(self.mobPhoneNumber.prefix(self.countryLimit))
                        }
                        if self.mobPhoneNumber.count < countryLimit {
                            self.applyPatternOnNumbers(&mobPhoneNumber, pattern: countryPattern, replacementCharacter: "#")
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .frame(height: 56)
            .background(ColorEnum.color_863ED5.getColor.opacity(0.07))
            .clipShape(RoundedRectangle(cornerRadius: 78.0))
            .overlay(
                RoundedRectangle(cornerRadius: 78.0)
                    .stroke(ColorEnum.color_863ED5.getColor.opacity(0.12), lineWidth: 2.0)
            )
        }
        .frame(height: 56)
    }
    
    //MARK: - APPLY PATTERN ON NUMBERS -
    private func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
    }
}

#Preview {
    CustomPhoneNumberTextField(
        countryFlag: Binding.constant(""),
        countryCode: Binding.constant(""),
        mobPhoneNumber: Binding.constant(""),
        countryPattern: Binding.constant(""),
        countryLimit: Binding.constant(0)
    )
}
