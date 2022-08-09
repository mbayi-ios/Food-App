//
//  MenuCategoryCell.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct MenuCategoryCell: View {
    @Environment(\.theme) var theme: Theme

    @State private var isExpanded = true

    let title: String
    let description: String
    let items: [MenuItem]

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(theme.typography.headingMedium)

                    Text(description)
                        .font(theme.typography.body)

                }

                Spacer()

                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .font(.system(size: 14, weight: .bold))

            }
            .padding(.horizontal, 16)
            .onTapGesture {
                isExpanded.toggle()
            }
            Divider()
                .padding(.top, 10)

            if isExpanded {
                ForEach(items) { item in
                    VStack {
                        MenuItemCell(menuItem: item)
                        Divider()
                            .padding(.top, 10)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .padding(.top, 10)
    }
}

struct MenuCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryCell(title: "Category 1", description: "A two line category description would look like this(does not stick on scroll)", items: MenuItem.MockMenuItemArray)
    }
}
