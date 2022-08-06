//
//  SecureFormField.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI


struct SecureFormField: View {
    private enum FieldTag {
        case hidden
        case visible
    }

    @Environment(\.theme) var theme: Theme
    @FocusState private var focusedField: FieldTag?
    @Binding var text: String
    @State private var isTextHidden: Bool = true

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
            self._text = text
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

            HStack(alignment: .center, spacing: 2.5) {
                if isTextHidden {
                    SecureField(placeholder ?? title, text: $text)
                        .focused($focusedField, equals: .hidden)
                        .autocapitalization(autocapitalized)
                        .font(theme.typography.body)
                        .foregroundColor(theme.colors.textDefault)
                        .keyboardType(keyboardType)
                        .onSubmit { self.onCommit() }
                } else {
                    TextField(placeholder ?? title, text: $text)
                        .focused($focusedField, equals: .visible)
                        .autocapitalization(autocapitalized)
                        .font(theme.typography.body)
                        .foregroundColor(theme.colors.textDefault)
                        .keyboardType(keyboardType)
                        .onSubmit { self.onCommit()}
                }
                Button {
                    isTextHidden.toggle()
                    focusedField = isTextHidden ? .hidden : .visible
                } label: {
                    Image(systemName: isTextHidden ? "eye.fill": "eye.slash.fill")
                        .resizable()
                        .scaledToFit()
                        .font(Font.title.weight(.medium))
                        .foregroundColor(theme.colors.textDefault)
                        .frame(width: 16, height: 16, alignment: .center)
                }
                .padding(.trailing, 5)
            }
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 6, style: .circular)
                        .stroke(theme.colors.borderDefault, lineWidth: 1))
        }
    }
}

struct SecureFormField_Previews: PreviewProvider {
    @State static var text = "secureFormField"
    static var previews: some View {
        SecureFormField(text: $text, title: "Secure Field", placeholder: "secure placeholder", keyboardType: .emailAddress, autocapitalized: .words, onCommit: {print("secureFormField")})
    }
}
