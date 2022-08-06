//
//  Footer.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

extension View {
    func footer<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        VStack {
            self
            Spacer()
        }.safeAreaInset(edge: .bottom) {
            Footer(content: content)
        }

    }
}
private struct Footer<Content: View> : View {
    @Environment(\.theme) var theme

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    private let content: Content

    var body: some View {
        VStack {
            Divider().foregroundColor(theme.colors.borderSubdued)
            content.padding(16)
        }
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("test\nTest")
        }.footer {
            Button {
                print("test")
            } label: {
                Text("Footer Button")
            }.primary()
        }
    }
}
