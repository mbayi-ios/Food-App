//
//  Typography.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI
import CoreText

public struct Typography {
    public var displayXLarge: Font {inter(size: 42).weight(.bold) }

    public var displayLarge: Font { inter(size: 32).weight(.semibold) }

    public var displayMedium: Font { inter(size: 26).weight(.regular) }

    public var displaySmall: Font { inter(size: 20).weight(.regular) }

    public var headingMedium: Font { inter(size: 20).weight(.semibold) }

    public var headingSmall: Font { inter(size: 16).weight(.semibold) }

    public var subheading: Font { inter(size: 12).weight(.semibold) }

    public var body: Font { inter(size: 14) }

    public var caption: Font { inter(size: 12) }

    public var button: Font {inter(size: 16).weight(.bold) }

    public var buttonLink: Font { inter(size: 12) }

    public var buttonLinkBold: Font { inter(size: 12).weight(.bold) }

    public var menuLink: Font {inter(size: 18) }

    public var placeholderText: Font { inter(size: 14) }

    private func inter(size: CGFloat) -> Font {
        let ctFont = CTFontCreateWithName("Inter" as CFString, size, nil)
        return Font(ctFont)
    }
}
