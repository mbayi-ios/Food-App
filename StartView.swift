//
//  StartView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct StartView: View {
    @Environment(\.theme) var theme: Theme
    @State private var isShowingLocationView = false

    var body: some View {
        NavigationView {
            VStack() {
                Spacer()
                makeIllustration()

                VStack(spacing: 15) {
                    Text("Order Direct. \n We all win.")
                        .multilineTextAlignment(.center)
                        .font(theme.typography.displayLarge)

                    Text("Every order saves your money and\n helps us thrive")
                        .multilineTextAlignment(.center)
                        .font(theme.typography.body)
                        .lineSpacing(5)

                    NavigationLink(destination: StartLocationView(), isActive: $isShowingLocationView) {
                        Button("Sounds Good") {
                            isShowingLocationView = true
                        }
                        .primary()
                        .frame(width: 135)
                        .minimumScaleFactor(0.4)
                    }
                    .offset(y: 15)
                }
                .frame(width: 250, height: 200)
                Spacer(minLength: 200)
            }
        }
    }
}
extension StartView {
    private func makeIllustration() -> some View {
        ZStack {
            Image("Walkthrough_Order_Win")
                .resizable()
                .scaledToFit()
                .frame(width: 85, height: 95)
                .position(x: 130, y: 130)
                .foregroundColor((Color("Brand", bundle: .main)))

            Image("Walkthrough_Order_Circle")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .position(x: 115, y: 40)

            Image("Walkthrough_Order_Direct")
                .resizable()
                .scaledToFit()
                .frame(width: 55, height: 55)
                .position(x: 115, y: 40)
                .foregroundColor((Color("Brand", bundle: .main)))

            Image("Walkthrough_Logo_Circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .position(x: 60, y: 95)
                .shadow(color: .black.opacity(0.08), radius: 0.1, x: 0, y: 4)

            Image("Brand")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .position(x: 60, y: 95)
        }
        .frame(width: 200, height: 200)
    }
}
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
