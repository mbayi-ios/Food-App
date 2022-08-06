//
//  FooterFilled.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

extension View {
    func footerFilled<Content: View >(@ViewBuilder content: () -> Content) -> some View {
        VStack {
            self
            Spacer()

        }.safeAreaInset(edge: .bottom) {
            footer(content: content)
        }.ignoresSafeArea(edges: .bottom)
    }
}
private struct FooterFilled<Content: View>: View {
    @Environment(\.theme) var theme

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    private let content: Content

    var body: some View {
        VStack {
            content
        }
    }
}

struct FooterFilled_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("test\nTest")
        }.footerFilled {
            ZStack {
                Rectangle()
                    .frame(height: 150)
                    .foregroundColor(.blue)
                Text("Footer Text")
                    .colorInvert()
            }
        }
    }
}
