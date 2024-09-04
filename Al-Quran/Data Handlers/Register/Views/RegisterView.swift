//
//  RegisterView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import SwiftUI
import SwiftData

struct RegisterView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var presentSheet: Bool = false
    @State var countryCode : String = "+92"
    @State var countryFlag : String = "🇵🇰"
    @State var countryPattern : String = "### ### ####"
    @State var countryLimit : Int = 12
    @State var mobPhoneNumber = ""
    @State var errorMessage: String = ""
    @State var showPopup: Bool = false
    //FocusState
    @FocusState private var keyIsFocused: Bool
    //Binding
    @Binding var navigationPath: [Screen]
    //Query
    @Query var users: [UserModel]
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 0) {
                CustomTopBackView(
                    onPress: {
                        Routing.shared.popToView(views: &self.navigationPath)
                    }
                ) // Back Button View
                CustomTitleView(
                    title: StringConstants.register.rawValue
                ) // Title
                    .padding(.top, 30)
                CustomDescriptionView(
                    title: StringConstants.newHere.rawValue
                ) // Description
                .padding(.top, 20)
                VStack (spacing: 25) {
                    CustomEmailTextField(
                        email: self.$email
                    ) // Email
                    CustomPasswordTextField(
                        password: self.$password,
                        placeHolder: StringConstants.password.rawValue
                    ) // Password
                    CustomPasswordTextField(
                        password: self.$confirmPassword,
                        placeHolder: StringConstants.confirmPassword.rawValue
                    ) // Confirm Password
                    CustomPhoneNumberTextField(
                        countryFlag: self.$countryFlag,
                        countryCode: self.$countryCode,
                        mobPhoneNumber: self.$mobPhoneNumber,
                        countryPattern: self.$countryPattern,
                        countryLimit: self.$countryLimit,
                        onPress: {
                            self.presentSheet = true
                        }
                    ) // Phone Number
                    CustomLoginButton(
                        title: StringConstants.register.rawValue,
                        onPress: {
                            if (self.validation()) {
                                self.addUser()
                            }
                        }
                    ) // Register Button
                } // Emails and Button
                .padding(.top, 46)
                Spacer()
                HStack (spacing: 4) {
                    Spacer()
                    Text(StringConstants.alreadyAMember.rawValue)
                        .font(.getRegular(17.0))
                        .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    Button(action: {
                        Routing.shared.popToView(views: &self.navigationPath)
                    }, label: {
                        Text(StringConstants.signIn.rawValue)
                            .font(.getSemibold(17.0))
                            .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    })
                    Spacer()
                } // Dont have an account
            }
            .padding(.horizontal, 25)
            PhoneView(
                presentSheet: self.$presentSheet,
                countryFlag: self.$countryFlag,
                countryCode: self.$countryCode,
                countryLimit: self.$countryLimit,
                countryPattern: self.$countryPattern,
                mobileNumber: self.$mobPhoneNumber
            )
            .offset(y: self.presentSheet ? 0 : 900)
            ErrorPopupView(message: self.errorMessage, showPopup: self.$showPopup)
        }
        .animation(.bouncy.speed(0.6), value: self.presentSheet)
    }
    
    //MARK: - VALIDATION -
    private func validation() -> Bool {
        var errorMessage: String?
        
        if (self.email == "") {
            errorMessage = "Please enter email address"
        } else if !(self.email.isValidEmail()) {
            errorMessage = "Please enter valid email address"
        } else if (self.password == "") {
            errorMessage = "Please enter password"
        } else if (self.confirmPassword == "") {
            errorMessage = "Please enter confirm password"
        } else if (self.password != self.confirmPassword) {
            errorMessage = "Password doesn't match"
        } else if (self.mobPhoneNumber == "") {
            errorMessage = "Please enter mobile number"
        } else if (self.mobPhoneNumber.count < self.countryLimit) {
            errorMessage = "Please enter valid mobile number"
        }
        
        if let error = errorMessage {
            self.errorMessage = error
            self.showPopup = true
            return false
        } else {
            return true
        }
    }
    
    //MARK: - ADD USER -
    private func addUser() {
        let user = UserModel()
        
        user.email = self.email
        user.password = self.password
        user.phone = self.countryCode + self.mobPhoneNumber
        
        if (self.users.count == 0) {
            Routing.shared.navigateToView(views: &self.navigationPath, view: .name(user: user))
        } else {
            if ((self.users.first(where: { $0.email == self.email })) != nil) {
                self.errorMessage = "User already exist"
                self.showPopup = true
            } else {
                Routing.shared.navigateToView(views: &self.navigationPath, view: .name(user: user))
            }
        }
    }
}

#Preview {
    RegisterView(
        navigationPath: Binding.constant([])
    )
}
