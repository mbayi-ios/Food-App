//
//  MenuView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                MenuOrderTypeBar()

                ScrollView {
                    MenuLocationBanner()
                    Divider()
                    MenuCategoryView(categories: Category.MockCategoryArray)
                }
            }
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: .white, titleColor: .black)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
