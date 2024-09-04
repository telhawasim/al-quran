//
//  PhoneView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import SwiftUI

struct PhoneView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State private var searchCountry: String = ""
    //Normal
    let counrties: [Country] = Bundle.main.decode("CountryNumbers.json")
    //Binding
    @Binding var presentSheet: Bool
    @Binding var countryFlag: String
    @Binding var countryCode: String
    @Binding var countryLimit: Int
    @Binding var countryPattern: String
    @Binding var mobileNumber: String
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.white)
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: -8) {
                        Text("Choose")
                            .font(.getRegular(25.0))
                            .foregroundStyle(ColorEnum.color_863ED5.getColor)
                        Text("country")
                            .font(.getRegular(25.0))
                            .foregroundStyle(ColorEnum.color_863ED5.getColor)
                    }
                    Spacer()
                    CustomBackButton(
                        image: ImageEnum.icCross.rawValue,
                        onPress: {
                            self.presentSheet = false
                        }
                    )
                } // Back Button and Title
                ZStack {
                    TextField(text: self.$searchCountry, label: {
                        Text(StringConstants.search.rawValue)
                            .font(.getRegular(16.0))
                            .foregroundStyle(ColorEnum.color_863ED5.getColor.opacity(0.39))
                    })
                    .font(.getRegular(16.0))
                    .foregroundStyle(ColorEnum.color_863ED5.getColor)
                    .padding(.horizontal, 27)
                } // Search Textfield
                .frame(maxWidth: .infinity, minHeight: 56)
                .background(ColorEnum.color_863ED5.getColor.opacity(0.07))
                .clipShape(RoundedRectangle(cornerRadius: 78.0))
                .overlay(
                    RoundedRectangle(cornerRadius: 78.0)
                        .stroke(ColorEnum.color_863ED5.getColor.opacity(0.12), lineWidth: 2.0)
                )
                ScrollView (.vertical, showsIndicators: false) {
                    LazyVStack (spacing: 18) {
                        ForEach(self.filteredCountry, id: \.code) { counrty in
                            Button(action: {
                                self.countryFlag = counrty.flag
                                self.countryCode = counrty.dial_code
                                self.countryLimit = counrty.limit
                                self.countryPattern = counrty.pattern
                                self.mobileNumber = ""
                                self.presentSheet = false
                            }, label: {
                                ZStack {
                                    HStack (spacing: 15) {
                                        Text(counrty.flag)
                                        Text(counrty.name)
                                            .font(.getRegular(16.0))
                                            .foregroundStyle(self.countryFlag == counrty.flag ? Color.white : ColorEnum.color_863ED5.getColor)
                                        Spacer()
                                        Text(counrty.dial_code)
                                            .font(.getRegular(16.0))
                                            .foregroundStyle(self.countryFlag == counrty.flag ? Color.white : ColorEnum.color_863ED5.getColor)
                                    }
                                    .padding(.horizontal, 17)
                                }
                                .frame(maxWidth: .infinity, minHeight: 56)
                                .background(self.countryFlag == counrty.flag ?
                                            AnyView(LinearGradient(colors: [
                                                ColorEnum.color_672CBC.getColor,
                                                ColorEnum.color_672CBC.getColor.opacity(0.5)
                                            ], startPoint: .leading, endPoint: .trailing)) :
                                                AnyView(Color.white)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 78.0))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 78.0)
                                        .stroke(ColorEnum.color_863ED5.getColor.opacity(0.12), lineWidth: 2.0)
                                )
                                .padding(.horizontal, 2)
                            })
                        }
                    }
                }
                .padding(.top, 12)
            }
            .padding(.horizontal, 25)
        }
    }
    
    //MARK: - FILTERED RESORTS -
    var filteredCountry: [Country] {
        if self.searchCountry.isEmpty {
            return self.counrties
        } else {
            return self.counrties.filter { $0.name.contains(self.searchCountry) }
        }
    }
    
    //MARK: - BACKGROUND -
    func backGround(flag: String) -> AnyShapeStyle {
        if (flag == self.countryFlag) {
            AnyShapeStyle(LinearGradient(colors: [
                ColorEnum.color_672CBC.getColor,
                ColorEnum.color_672CBC.getColor.opacity(0.5)
            ], startPoint: .leading, endPoint: .trailing))
        } else {
            AnyShapeStyle(Color.white)
        }
    }
}

#Preview {
    PhoneView(
        presentSheet: Binding.constant(false),
        countryFlag: Binding.constant(""),
        countryCode: Binding.constant(""),
        countryLimit: Binding.constant(0),
        countryPattern: Binding.constant(""),
        mobileNumber: Binding.constant("")
    )
}
