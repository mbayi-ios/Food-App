//
//  ButtonStyles.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

extension Button {
    func primary() -> some View {
        buttonStyle(BorderedFilled(.primary))
    }
    func subdued() -> some View {
        buttonStyle(BorderedFilled(.subdued))
    }
    func critical() -> some View {
        buttonStyle(BorderedFilled(.critical))
    }
    func link() -> some View {
        buttonStyle(Link())
    }
    func radio(id: String, selectedId: Binding<String>) -> some View {
        buttonStyle(Radio(id: id, selectedId: selectedId))
    }
}

private struct BorderedFilled: ButtonStyle {
    @Environment(\.theme) var theme: Theme
    @Environment(\.isEnabled) private var isEnabled

    init(_ style: Style) {
        self.style = style
    }

    enum Style {
        case primary
        case subdued
        case critical
    }

    private let style: Style

    func makeBody(configuration: Self.Configuration) -> some View {
        let onFill: Color
        let fill: Color
        let fillPressed: Color
        let border: Color

        switch(style, isEnabled) {
        case (.primary, true):
            onFill = theme.colors.textOnPrimary
            fill = theme.colors.actionPrimary
            fillPressed = theme.colors.actionPrimaryPressed
            border = theme.colors.borderActionPrimary

        case(.primary, false):
            onFill = theme.colors.textDefault
            fill = theme.colors.actionPrimaryDisabled
            fillPressed = theme.colors.actionPrimaryDisabled
            border = theme.colors.actionPrimaryDisabled

        case (.subdued, _):
            onFill = theme.colors.textDefault
            fill = theme.colors.actionSubdued
            fillPressed = theme.colors.actionSubduedPressed
            border = theme.colors.borderDefault

        case (.critical, _):
            onFill = theme.colors.textDefault
            fill = theme.colors.actionSubdued
            fillPressed = theme.colors.actionSubduedPressed
            border = theme.colors.borderCritical

        }
        return Group {
            configuration.label
                .font(theme.typography.button)
                .padding(.vertical, 13)
        }.frame(maxWidth: .infinity)
            .frame(minHeight: 46)
            .padding(.horizontal, 16)
            .foregroundColor(onFill)
            .background(configuration.isPressed ? fillPressed: fill)
            .cornerRadius(6)
            .overlay(RoundedRectangle(cornerRadius: 6)
            .stroke(border, lineWidth: 1.0))
    }
}

private struct Link: ButtonStyle {
    @Environment(\.theme) var theme: Theme

    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .foregroundColor(theme.colors.interactiveDefault)
            .font(theme.typography.buttonLink)
    }
}

private struct Radio: ButtonStyle {
    @Environment(\.theme) var theme: Theme

    @Binding var selectedId: String

    let id: String

    init(id: String, selectedId: Binding<String>) {
        self.id = id
        self._selectedId = selectedId
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        if self.id == $selectedId.wrappedValue {
            Circle()
                .strokeBorder(theme.colors.borderDisabled, lineWidth: 4)
                .background(Circle().fill(theme.colors.actionPrimaryPressed))
                .frame(width: 16, height: 16)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        } else {
            Circle()
                .strokeBorder(theme.colors.actionPrimaryPressed)
                .frame(width: 16, height: 16)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }
    }
}


struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            Button("primary") {
                print("Primary")
            }.primary()
            .theme(Theme(colors: Colors(with: "#0F843D")))

            Button("subdued") {
                print("left justified")
            }.subdued()

            Button("Critical") {
                print("critical")
            }.critical()

            HStack {
                Button("left justified") {
                    print("Left Justified")
                }.primary()
                Spacer().frame(maxWidth: .infinity)
            }
            Button("Link") {
                print("Link")
            }.link()
        }.padding(.horizontal, 16)
    }
}
