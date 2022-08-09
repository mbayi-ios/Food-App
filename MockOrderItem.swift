//
//  MockOrderItem.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import Foundation

struct MockOrderItem: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let description: String?

}

struct MockData {
    static func itemList() -> [MockOrderItem] {
        return [
            MockOrderItem(title: "Cheese Pizza", price: "$12.25", description: "NY style classic thin crust 14in cheese pizza, cut into 8 slices. Perfectly hot and crispy, the best thing you could ever have. I really need this description to be long, so please ignore haha"),
            MockOrderItem(title: "Deep Dish Pie", price: "$21.00", description: "Some might call it a pizza, but isn't it really a casserole xD"),
            MockOrderItem(title: "Pineapple Pizza", price: "$15.95", description: "Not bad honestly!\nThis is a new line\nANOTHER NEW LINE"),
            MockOrderItem(title: "The Pizza With A Really Really Really Really Long Name", price: "$9001.00", description: "Short Description"),
            MockOrderItem(title: "The One Dollar Slice", price: "$1.00", description: nil)
        ]
    }
}
