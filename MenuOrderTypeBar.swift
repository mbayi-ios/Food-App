//
//  MenuOrderTypeBar.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct MenuOrderTypeBar: View {
    @Environment(\.theme) var theme: Theme

    @State private var locationSelectPresented = false

    var body: some View {
        HStack {
            HStack {
                Text("ASAP • Pickup |")
                    .font(theme.typography.subheading)

                Text("Fashion Square")
                    .font(theme.typography.caption)
            }
            Spacer()

            Button(action: {
                locationSelectPresented = true
            }, label: {
                Text("EDIT")
                    .font(theme.typography.buttonLinkBold)
                    .tint(theme.colors.actionPrimary)
            })
                .fullScreenCover(isPresented: $locationSelectPresented) {

                }
        }
        .frame(height: 40)
        .padding(.horizontal, 24)
        .background(theme.colors.surfaceSubdued)
        .shadow(radius: 0.5)
        .shadow(color: .black.opacity(0.1), radius: 0, x: 0, y: 2)


    }
}

struct MenuOrderTypeBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuOrderTypeBar()
    }
}
