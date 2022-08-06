//
//  FormField.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

struct FormField: View {
    @Environment(\.theme) var theme: Theme

    @Binding var text: String

    private let title: String
    private let placeholder: String?
    private let autocapitalized: UITextAutocapitalizationType
    private let keyboardType: UIKeyboardType
    private let onCommit: () -> Void

    init(
        text: Binding<String>,
        title: String,
        placeholder: String? = nil,
        keyboardType: UIKeyboardType = .default,
        autocapitalized: UITextAutocapitalizationType = .none,
        onCommit: @escaping () -> Void) {
            _text = text
            self.title = title
            self.placeholder = placeholder
            self.keyboardType = keyboardType
            self.autocapitalized = autocapitalized
            self.onCommit = onCommit
        }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(theme.typography.headingSmall)
                .foregroundColor(theme.colors.textDefault)

            TextField(placeholder ?? title, text: $text)
                .autocapitalization(autocapitalized)
                .font(theme.typography.body)
                .foregroundColor(theme.colors.textDefault)
                .keyboardType(keyboardType)
                .onSubmit(onCommit)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 6, style: .circular)
                .stroke(theme.colors.borderDefault, lineWidth: 1))
        }
    }
}

struct FormField_Previews: PreviewProvider {
    @State static var text = "Hello"
    static var previews: some View {
        FormField( text: $text, title: "title", placeholder: "placeholder", keyboardType: .emailAddress, autocapitalized: .words, onCommit: { print("any action you want")})
    }
}

