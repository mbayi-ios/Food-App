//
//  Colors.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import Foundation
import SwiftUI

struct Colors {
    private let brand: Color

    init(with brand: Color) {
        self.brand = brand
    }

    var accentBrand: Color {
        get {
            if UIColor(brand).isLight() {
                return Color(UIColor(brand).darker(by: 25))
            } else {
                return Color(UIColor(brand).lighter(by: 25))
            }
        }
    }

    var textDefault: Color { "#000000" }
    var textSubdued: Color { "#737373" }
    var textOnPrimary: Color { "#FFFFFF" }

    var textDisabled: Color{ "#404040" }

    var textSuccess: Color { "#069360" }
    var textWarning: Color { "#98661B" }
    var textCritical: Color { "#B53317" }

    var actionPrimary: Color { brand }
    var actionPrimaryPressed: Color { brand }
    var actionPrimaryDisabled: Color { "#E0E0E0" }

    var actionSubdued: Color { "#FFFFFF" }
    var actionSubduedPressed: Color { "#F5F5F5" }

    var interactiveDefault: Color {brand}
    var interactivePressed: Color {brand}
    var interactiveDisabled: Color { "#E0E0E0" }

    var borderDefault: Color { "#737373" }
    var borderSubdued: Color { "#E5E5E5" }
    var borderActionPrimary: Color { brand }
    var borderCritical: Color { "#891C1C" }
    var borderDisabled: Color { "#E0E0E0" }
    var borderSelected: Color { brand }

    var surfaceSubdued: Color { "#F5F5F5" }
    var surfaceSuccess: Color { "#ECFDF5" }
}

extension Color: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let hex = value.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64

        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)

        }

        self.init (
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue: Double(b) / 255,
        opacity: Double(a) / 255
        )
    }
}

extension UIColor {
    func isLight() -> Bool {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let brightness = ((r * 299) + (g * 587) + (b * 114)) / 1_000

        return brightness >= 0.5
    }

    func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: abs(percentage))
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: -1 * abs(percentage))
    }

    func adjust( by percentage: CGFloat = 30.0) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return self }

        return UIColor(red: min(red + percentage / 100, 1.0),
                       green: min(green + percentage/100, 1.0),
                       blue: min(blue + percentage/100, 1.0),
                       alpha: alpha)
    }
}


struct AccentColorExample_Previews: PreviewProvider {
    static var previews: some View {
        AccentColorExample()
    }
}

struct AccentColorExample: View {
    @Environment(\.theme) var theme: Theme

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            VStack {
                Circle()
                    .foregroundColor(theme.colors.actionPrimary)
                    .frame(width: 100, height: 100)

                Text("brand colors")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textDefault)
            }
            VStack {
                Circle()
                    .foregroundColor(theme.colors.accentBrand)
                    .frame(width: 100, height: 100)

                Text("Accent Color")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textDefault)
            }
        }
    }
}
