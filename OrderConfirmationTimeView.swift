//
//  OrderConfirmationTimeView.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct OrderConfirmationTimeView: View {
    @Environment(\.theme) var theme: Theme

    @State private var progress = 0.3
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ProgressView(value: progress, total: 1.0)
                .progressViewStyle(WeightedLinear())
                .frame(height: 10)
            Text("ESTIMATED DELIVERY TIME")
                .font(theme.typography.subheading)

            Text("11:11PM")
                .font(theme.typography.displayXLarge)

            Text("6335 E Monterra Way, APT 3, Scottsdale AZ, 85266")
                .font(theme.typography.caption)
        }
    }
}

struct OrderConfirmationTimeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationTimeView()
    }
}
