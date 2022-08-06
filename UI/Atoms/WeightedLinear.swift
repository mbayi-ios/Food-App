//
//  WeightedLinear.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

struct WeightedLinear: ProgressViewStyle {
    @Environment(\.theme) var theme: Theme

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            GeometryReader { geo in
                Rectangle()
                    .frame(maxWidth: geo.size.width * CGFloat(fractionCompleted))
                    .foregroundColor(Color("Brand", bundle: .main))
                    .cornerRadius(.greatestFiniteMagnitude)
            }
            .background(theme.colors.surfaceSubdued)
            .cornerRadius(.greatestFiniteMagnitude)
        }
    }

}
