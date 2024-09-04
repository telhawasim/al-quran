//
//  SignView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 31/08/2024.
//

import SwiftUI
import SwiftData

struct SignInView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var showPopup: Bool = false
    //Binding
    @Binding var navigationPath: [Screen]
    //Query
    @Query private var users: [UserModel]
    
    //MARK: - VIEWS -
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 0) {
                CustomTopBackView(
                    onPress: {
                        Routing.shared.popToView(views: &self.navigationPath)
                    }
                ) // Back Button
                CustomTitleView(
                    title: StringConstants.signIn.rawValue
                ) // Title
                .padding(.top, 30)
                CustomDescriptionView(
                    title: StringConstants.alreadyHaveAnAccount.rawValue
                ) // Description
                .padding(.top, 20)
                VStack (spacing: 25) {
                    CustomEmailTextField(email: self.$email)
                    CustomPasswordTextField(password: self.$password, placeHolder: StringConstants.password.rawValue)
                    CustomLoginButton(
                        title: StringConstants.signIn.rawValue,
                        onPress: {
                            if (self.validation()) {
                                self.doesUserExist()
                            }
                        }
                    )
                } // Emails and Button
                .padding(.top, 56)
                Spacer()
                HStack (spacing: 4) {
                    Spacer()
                    Text(StringConstants.dontHaveAnAccount.rawValue)
                        .font(.getRegular(17.0))
                        .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    Button(action: {
                        Routing.shared.navigateToView(views: &self.navigationPath, view: .register)
                    }, label: {
                        Text(StringConstants.register.rawValue)
                            .font(.getSemibold(17.0))
                            .foregroundStyle(ColorEnum.color_672CBC.getColor)
                    })
                    Spacer()
                } // Dont have an account
            }
            .padding(.horizontal, 25)
            ErrorPopupView(message: self.errorMessage, showPopup: self.$showPopup)
        }
        .onAppear {
            self.email = ""
            self.password = ""
        }
    }
    
    //MARK: - VALIDATION -
    private func validation() -> Bool {
        var error: String?
        
        if (self.email == "") {
            error = "Please enter email address"
        } else if !(self.email.isValidEmail()) {
            error = "Please enter valid email address"
        } else if (self.password == "") {
            error = "Please enter password"
        }
        
        if let error = error {
            self.errorMessage = error
            self.showPopup = true
            return false
        } else {
            return true
        }
    }
    
    //MARK: - DOES USER EXIST -
    private func doesUserExist() {
        if let existingUser = self.users.first(where: { $0.email == self.email && $0.password == self.password }) {
            MyUserDefaults.user = existingUser
            Routing.shared.navigateToView(views: &self.navigationPath, view: .tabbar)
        } else {
            self.errorMessage = "User doesn't exist"
            self.showPopup = true
        }
    }
}

#Preview {
    SignInView(
        navigationPath: Binding.constant([])
    )
}
