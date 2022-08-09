//
//  Category.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import Foundation

struct Category: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let items: [MenuItem]

    static let MockCategoryArray = [
        Category(id: 0, name: "category 1", description: "Category description 1", items: MenuItem.MockMenuItemArray),
        Category(id: 1, name: "category 2", description: "Category description 2", items: MenuItem.MockMenuItemArray),
        Category(id: 2, name: "category 3", description: "Category description 3", items: MenuItem.MockMenuItemArray)
    ]
}
