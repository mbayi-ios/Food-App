//
//  MenuItem.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: String
    let url: String

    static let MockMenuItemArray = [
            MenuItem(id: 0, name: "Item Name 1", description: "Desc For Item 1", price: "$5.00", url: "https://media-cdn.tripadvisor.com/media/photo-s/1c/a5/8e/a8/cheers-to-great-drinks.jpg"),
            MenuItem(id: 1, name: "Item Name 2", description: "Desc For Item 2", price: "$10.00", url: "https://media-cdn.tripadvisor.com/media/photo-s/1c/a5/8e/a8/cheers-to-great-drinks.jpg"),
            MenuItem(id: 2, name: "Item Name 3", description: "Desc For Item 3", price: "$100.00", url: "https://media-cdn.tripadvisor.com/media/photo-s/1c/a5/8e/a8/cheers-to-great-drinks.jpg"),
    ]
}
