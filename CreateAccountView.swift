//
//  CreateAccountView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI
import Combine

class AccountForm: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailAddress: String = ""
    @Published var phoneNumberText: String = ""
    @Published var password: String = ""

    var phoneNumber: Int? {
        Int(phoneNumberText)
    }

    func isValid() -> Bool {
        !firstName.isEmpty
        && !lastName.isEmpty
        && !emailAddress.isEmpty
        && phoneNumber != nil
        && !password.isEmpty
    }
}

struct CreateAccountView: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.dependencies.useCases.signUpUseCase) var signUpUseCase: SignUpUseCase

    @StateObject private var form = AccountForm()
    @State private var isVerifyPhonePresented: Bool = false
    @State private var isLoading: Bool = false
    @State private var pinCode: String = ""

    @State var firstName: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            headerSection()
            formSection()
            termsOfServiceSection()
            verifyEmailView()

            Spacer()
        }
        .padding(.horizontal, 16)
        .footer {
            Button("View Menu") {
                print("view menu")
            }
            .primary()
            .disabled(!form.isValid())
        }
        .partialSheet(isPresented: $isVerifyPhonePresented, title: "Verify Email Address"){
            verifyEmailView()
        }
    }

    private func headerSection() -> some View {
        Group {
            Image("Brand")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45, alignment: .center)

            Text("Create Your Account")
                .font(theme.typography.displayMedium)
                .foregroundColor(theme.colors.textDefault)
                .padding(.bottom, 16)
        }
    }

    private func formSection() -> some View {
        Group {
        HStack(alignment: .center, spacing: 16) {
            FormField(text: $form.firstName, title: "First Name", placeholder: "First Name", keyboardType: .default, autocapitalized: .words) {
                debugPrint("Committed Frist Name text Field!")
            }
            FormField(text: $form.lastName, title: "Last Name", placeholder: "Last Name", keyboardType: .default, autocapitalized: .words) {
                debugPrint("Committed Frist Name text Field!")
            }

            }
            FormField(text: $form.emailAddress, title: "First Name", placeholder: "First Name", keyboardType: .emailAddress, autocapitalized: .words) {
                debugPrint("Committed Frist Name text Field!")
            }

            SecureFormField(text: $form.password, title: "Password", placeholder: "Password", keyboardType: .default, autocapitalized: UITextAutocapitalizationType.none){
                print("committed Password text field!")
            }
        }

    }

    private func termsOfServiceSection() -> some View {
        VStack(alignment: .center, spacing: 5) {
            Text("By creating an account, you agree to")
                .font(theme.typography.caption)
                .foregroundColor(theme.colors.textDefault)

            HStack(alignment: .center, spacing: 5) {
                Text("Lunchbox's")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textDefault)

                Button("Terms of Service"){
                    print("Terms of Service")
                }.link()

                Text("&")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textDefault)

                Button("Privacy Policy") {
                    print("Privacy Policy")
                }.link()
            }
        }
    }

    private func verifyEmailView() -> some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Please enter the PIN sent to the email address below to validate your account")
                .font(theme.typography.body)
                .foregroundColor(theme.colors.textDefault)
                .multilineTextAlignment(.center)
                .lineSpacing(5)

            Text(form.emailAddress)
                .font(theme.typography.body)
                .foregroundColor(theme.colors.borderDefault)

            VStack(alignment: .leading, spacing: 8){
                Text("Enter pin Code")
                    .font(theme.typography.body)
                    .foregroundColor(theme.colors.textDefault)

               PincodeField(canEdit: true, pinCode: $pinCode)

                Button("RESEND PIN") {
                    print("resent pin")
                }.link()

            }
            Button("submit") {
                print("submit")
            }
            .primary()

        }
        .padding(.horizontal, 16)
    }
}



struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
