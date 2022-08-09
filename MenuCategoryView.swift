//
//  MenuCategoryView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct MenuCategoryView: View {
    @Environment(\.theme) var theme: Theme

    var categories: [Category]

    var body: some View {
        VStack {
            ForEach(categories) { category in
                VStack{
                    MenuCategoryCell(title: category.name, description: category.description, items: category.items)
                }
            }
        }
    }
}

struct MenuCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            MenuCategoryView(categories: Category.MockCategoryArray)
        }
    }
}
