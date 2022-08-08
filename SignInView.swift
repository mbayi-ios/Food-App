//
//  SignInView.swift
//  FoodApp
//
//  Created by Amby on 07/08/2022.
//

import SwiftUI
import Combine

struct SignInView: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.dependencies.useCases.signInUseCase) var signInUseUse: SignInUseCase
    @Environment (\.dismiss) var dismiss

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            Text("Hello, Lunchbox!")
                .font(theme.typography.displayLarge)
                .padding()

            createAccountButton()

            FormField(text: $email, title: "Email Address", placeholder: "Email Address", keyboardType: .emailAddress, autocapitalized: .words) {
                print("committed text field!")
            }

            SecureFormField(text: $password, title: "Password", placeholder: "password", keyboardType: .default){
                print("committed text field!")
            }
        }
        .padding(.horizontal, 16)
        .footer {
            Button {
                isLoading = true
                signInUseUse.signIn(email: email, password: password)
                    .subscribe(Subscribers.Sink(receiveCompletion: { response in
                        print("response: \(response)")
                        isLoading = false
                        switch response {
                        case .finished:
                            dismiss()
                        case .failure(_):
                            print("TODO: present error")
                        }
                    }, receiveValue: { _ in

                    }))
            } label: {
                Text("Sign In")
            }
            .primary()
            .disabled(email.isEmpty || password.isEmpty)
        }.loadingOverlay($isLoading)
    }

    private func createAccountButton() -> some View {
        NavigationLink(destination: CreateAccountView()) {
            HStack(alignment: .center, spacing: 5) {
                Text("Don't have an account?")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textDefault)

                Text("CREATE ACCOUNT")
                    .font(theme.typography.buttonLinkBold)
                    .tint(theme.colors.actionPrimary)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
