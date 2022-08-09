//
//  OrderConfirmationPriceView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct OrderConfirmationPriceView: View {
    @Environment(\.theme) var theme: Theme

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Subtotal")
                Spacer()
                Text("$35.00")
            }
            .font(theme.typography.body)
            .foregroundColor(theme.colors.textSubdued)

            HStack {
                Text("Taxes")
                Spacer()
                Text("$1.00")
            }
            .font(theme.typography.body)
            .foregroundColor(theme.colors.textSubdued)

            HStack {
                Text("Tip")
                Spacer()
                Text("$3.00")
            }
            .font(theme.typography.body)
            .foregroundColor(theme.colors.textSubdued)

            HStack {
                Text("Total")
                Spacer()
                Text("$39.00")
            }
            .font(theme.typography.headingSmall)

            Divider()
                .padding(.top, 10)
        }
        .padding(.top, 5)
    }
}

struct OrderConfirmationPriceView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationPriceView()
    }
}
