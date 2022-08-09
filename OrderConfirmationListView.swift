//
//  OrderConfirmationListView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct OrderConfirmationListView: View {

    @State private var isExpanded = false

    var items = MockData.itemList()

    var body: some View {
        ExpandableOrderGroup(isExpanded: $isExpanded, title: "Order Summary", items: items )
    }
}

struct OrderConfirmationListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationListView()
    }
}
