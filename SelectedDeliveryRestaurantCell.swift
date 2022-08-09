//
//  SelectedDeliveryRestaurantCell.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct SelectedDeliveryRestaurantCell: View {
    @Environment(\.theme) var theme: Theme

    private let location: Location

    init(location: Location) {
        self.location = location
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Delivering Form")
                    .font(theme.typography.subheading)
                    .textCase(.uppercase)

                Spacer()

                NavigationLink {
                    ChangeDeliveryLocationView()
                } label: {
                    Text("Change")
                        .font(theme.typography.buttonLinkBold)
                        .textCase(.uppercase)
                }
            }
            HStack {
                Text(location.name )
                    .font(theme.typography.caption)
                Spacer()
            }
        }
        .padding(16)
        .background(theme.colors.actionSubduedPressed)
        .cornerRadius(2)
    }
}

struct SelectedDeliveryRestaurantCell_Previews: PreviewProvider {
    static var previews: some View {
        SelectedDeliveryRestaurantCell(location: LocationExamples.single)
    }
}
