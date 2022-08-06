//
//  HomeLastOrder.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct HomeLastOrder: View {
    @Environment(\.theme) var theme: Theme
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Your Last Order")
                    .font(theme.typography.headingMedium)

                Divider()
                    .frame(height: 1)
                    .background(.black)
            }
            VStack(alignment: .leading, spacing: 30) {
                HStack {
                    Text("Location Name")
                        .font(theme.typography.headingMedium)
                    Spacer()
                    Text("$40.00")
                        .font(theme.typography.body)
                }
                Text("Menu Item 1, menu item 2, menu item 3, etc")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textSubdued)

                HStack {
                    Button("View Receipt") {

                    }
                    .subdued()
                    .frame(width: 150)
                    Spacer()
                    Button("Reorder") {

                    }
                    .primary()
                    .frame(width: 150)
                }
            }
            .frame(height: 155)
            .padding(16)
            .background(.white)
            .cornerRadius(5)
            .shadow(radius: 2)
            .shadow(color: .black.opacity(0.1), radius: 0, x: 0, y: 4)

        }
        .padding(16)
    }
}

struct HomeLastOrder_Previews: PreviewProvider {
    static var previews: some View {
        HomeLastOrder()
    }
}
