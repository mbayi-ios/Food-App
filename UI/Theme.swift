//
//  Theme.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI
import Foundation

struct Theme {
    let colors: Colors
    let typography: Typography = Typography()
    let icons: Icons = Icons()
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue = Theme(colors: Colors(with: Color("#3c4366")))
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

extension View {
    func theme(_ theme: Theme) -> some View {
        environment(\.theme, theme)
    }
}
