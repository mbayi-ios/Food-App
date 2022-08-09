//
//  OrderConfirmationView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct OrderConfirmationView: View {
    private let isPickup: Bool

    init(isPickup: Bool = false ) {
        self.isPickup = isPickup
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                OrderConfirmationBannerView()

                OrderConfirmationTimeView()

                if isPickup {

                } else {
                    Divider()
                }
                OrderConfirmationListView()

                OrderConfirmationPaymentView()

                OrderConfirmationPriceView()
            }
            .padding(16)
        }
        .clipped()
        .footerFilled{
            OrderConfirmationFooterView()
        }
    }
}

struct OrderConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationView()
    }
}
