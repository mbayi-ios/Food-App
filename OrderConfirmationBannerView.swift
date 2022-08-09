//
//  OrderConfirmationBannerView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct OrderConfirmationBannerView: View {
    @Environment(\.theme) var theme: Theme
    var body: some View {
        HStack {
            Spacer()

            VStack {
                Image(systemName: "checkmark.circle")
                Text("Thank you for your order")
                    .font(theme.typography.headingSmall)

                Text("An email confirmation has been sent to\n {nmae @email.com}")
                    .font(theme.typography.body)
                    .frame(height: 35)
                    .lineSpacing(4)
                    .minimumScaleFactor(0.75)

                Text("order#10102928")
                    .font(theme.typography.body)

            }
            .padding(.horizontal, 16)
            .multilineTextAlignment(.center)

            Spacer()
        }
        .frame(height: 150)
        .background(theme.colors.surfaceSuccess)
        .cornerRadius(5)
    }
}

struct OrderConfirmationBannerView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationBannerView()
    }
}
