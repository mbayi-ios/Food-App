//
//  MenuLocationBanner.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct MenuLocationBanner: View {
    @Environment(\.theme) var theme: Theme
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Restaurant Nmae(Fashion Squared)")
                .font(theme.typography.displayMedium)

            HStack{
                Image("LocationPin")
                Text("0.4 mi . open Now")
                    .foregroundColor(theme.colors.textSuccess)
                Text("Until 11: 00 PM")

                Image(systemName: "chevron.right")
                Spacer()
            }
            .font(theme.typography.caption)
            .onTapGesture {
                //
            }

        }
        .padding(16)
    }
}

struct MenuLocationBanner_Previews: PreviewProvider {
    static var previews: some View {
        MenuLocationBanner()
    }
}
