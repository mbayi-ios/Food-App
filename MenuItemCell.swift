//
//  MenuItemCell.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct MenuItemCell: View {
    @Environment(\.theme) var theme: Theme
    
    let menuItem: MenuItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(menuItem.name)
                    .font(theme.typography.headingSmall)
                
                Text(menuItem.description)
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textSubdued)
                
                Text(menuItem.price)
                    .font(theme.typography.body)
                
                HStack {
                    Image("Dietary_DairyFree")
                    Image("Dietary_Vegitarian")
                    Image("Dietary_GlutenFree")
                    Image("Dietary_DairyFree")
                    Image("Dietary_NutFree")
                }
                .padding(.top, 10)
            }
            Spacer()
            
            AsyncImage(url: URL(string: menuItem.url)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(6)
        }
        .frame(height: 165)
        
    }
}

struct MenuItemCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCell(menuItem: MenuItem(id: 0, name: "Item Name 1", description: "Desc For Item 1", price: "$5.00", url: "https://media-cdn.tripadvisor.com/media/photo-s/1c/a5/8e/a8/cheers-to-great-drinks.jpg")
        )
    }
}
