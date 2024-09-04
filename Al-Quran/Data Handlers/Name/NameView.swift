//
//  NameView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 04/09/2024.
//

import SwiftUI
import SwiftData

struct NameView: View {
    
    //MARK: - VARIABLES -
    
    //Normal
    var user: UserModel?
    //State
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var errorMessage: String = ""
    @State private var showPopup: Bool = false
    //Binding
    @Binding var navigationPath: [Screen]
    //Enviornment
    @Environment(\.modelContext) private var context
    //Query
    @Query private var users: [UserModel]
    
    //MARK: - VIEWS -
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            CustomTopBackView(
                onPress: {
                    Routing.shared.popToView(views: &self.navigationPath)
                }
            )
            CustomTitleView(title: StringConstants.yourName.rawValue)
                .padding(.top, 30)
            VStack (spacing: 26) {
                CustomNameTextfield(
                    value: self.$firstName,
                    placeholder: StringConstants.firstName.rawValue
                )
                CustomNameTextfield(
                    value: self.$lastName,
                    placeholder: StringConstants.lastNameOptional.rawValue
                )
            } // Textfields
            .padding(.top, 40)
            CustomLoginButton(
                title: StringConstants.done.rawValue,
                onPress: {
                    if (self.validation()) {
                        self.updateUserInfo()
                    }
                }
            )
            .padding(.top, 36)
            Spacer()
        }
        .padding(.horizontal, 25)
    }
    
    //MARK: - VALIDATION -
    private func validation() -> Bool {
        var errorMessage: String?
        
        if (self.firstName == "") {
            errorMessage = "Please enter first name"
        }
        
        if let error = errorMessage {
            self.errorMessage = error
            self.showPopup = true
            return false
        } else {
            return true
        }
    }
    
    //MARK: - UPDATE USER INFO -
    private func updateUserInfo() {
        if let user = self.user {
            user.firstName = self.firstName
            user.lastName = self.lastName
            self.context.insert(user)
            MyUserDefaults.user = user
            Routing.shared.navigateToView(views: &self.navigationPath, view: .tabbar)
        }
    }
}

#Preview {
    NameView(
        navigationPath: Binding.constant([])
    )
}
