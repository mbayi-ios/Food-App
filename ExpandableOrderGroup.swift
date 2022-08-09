//
//  ExpandableOrderGroup.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct ExpandableOrderGroup: View {
    @Environment(\.theme) var theme: Theme

    @Binding var isExpanded: Bool

    let title: String
    var items: [MockOrderItem]


    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(title)
                    .font(theme.typography.headingMedium)

                Spacer()

                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .font(.system(size: 14, weight: .bold))
            }

            if isExpanded {
                ForEach(items) {item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.title)
                                .font(theme.typography.headingSmall)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 16)

                            Spacer()

                            Text(item.price)
                                .font(theme.typography.body)
                                .padding(.horizontal, 16)
                        }

                        if let description = item.description {
                            Text(description)
                                .font(theme.typography.body)
                                .foregroundColor(theme.colors.textSubdued)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(4)
                                .padding(.horizontal, 16)
                                .padding(.top, 2)
                        }
                        Divider()
                            .padding(.top, 10)
                    }
                }
            }
        }
        .onTapGesture {
            isExpanded.toggle()
        }
        .padding(.top, 10)
    }
}

struct ExpandableOrderGroup_Previews: PreviewProvider {
    @State static var isExpanded: Bool = true
    static var previews: some View {

        ExpandableOrderGroup(isExpanded: $isExpanded, title: "Order Summary", items: [MockOrderItem(title: "The One Dollar Slice", price: "$1.00", description: "Short Description")])
    }
}
