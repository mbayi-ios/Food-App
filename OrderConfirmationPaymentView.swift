//
//  OrderConfirmationPaymentView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct OrderConfirmationPaymentView: View {

    @Environment(\.theme) var theme: Theme

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "creditcard.fill")

                Text("Visa")
                    .font(theme.typography.body)

                Text(" •••• 4242")
                    .font(theme.typography.body)
                Spacer()
            }
            .padding(.top, 6)
            .padding(.bottom, 12)

            Divider()
        }
    }
}

struct OrderConfirmationPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationPaymentView()
    }
}
