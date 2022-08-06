//
//  PickerField.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

struct PickerField<Content: View>: View {
    @Environment(\.theme) var theme: Theme

    @Binding var text: String

    private let title: String
    private let placeholder: String?
    private let autocapitalized: UITextAutocapitalizationType
    private let onPress: () -> Void

    @ViewBuilder  private let leftView: Content?

    init(
        text: Binding<String>,
        title: String,
        placeholder: String? = nil,
        autocapitalized: UITextAutocapitalizationType = .none,
        isDisabled: Bool = true,
        @ViewBuilder leftIcon: () -> Content? = { nil },
        onPress: @escaping () -> Void) {
            self._text = text
            self.title = title
            self.placeholder = placeholder
            self.autocapitalized = autocapitalized
            self.leftView = leftIcon()
            self.onPress = onPress

        }
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(theme.typography.headingSmall)
                .foregroundColor(theme.colors.textDefault)

            Button { onPress() } label: {
                HStack {
                    leftView

                    Text(text)
                        .autocapitalization(autocapitalized)
                        .font(theme.typography.body)
                        .foregroundColor(theme.colors.textDefault)

                    Spacer()

                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(theme.colors.interactiveDefault)
                        .frame(width: 14, height: 14, alignment: .center)
                }
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 6, style: .circular)
                            .stroke(theme.colors.borderDefault, lineWidth: 1))
            }
        }
    }
}

struct PickerField_Previews: PreviewProvider {
    @State static var text = "password"
    static var previews: some View {
        PickerField(
            text: $text,
            title: "title",
            placeholder: "placeholder",
            autocapitalized: .none,
            isDisabled: false,
            leftIcon: {
                Image(systemName: "eye")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 14, height: 14, alignment: .center)
            },
            onPress: { print("any action to be completed")})
    }
}
