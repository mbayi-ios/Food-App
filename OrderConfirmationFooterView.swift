//
//  OrderConfirmationFooterView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct OrderConfirmationFooterView: View {
    @Environment(\.theme) var theme: Theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            Text("Questions about your order? Call us at {location phone } or \n e-mail us at {support mail}")
                .font(theme.typography.caption)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .minimumScaleFactor(0.75)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)

            Spacer()
        }
        .frame(height: 90)
        .background(theme.colors.surfaceSubdued)
    }
}

struct OrderConfirmationFooterView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationFooterView()
    }
}
