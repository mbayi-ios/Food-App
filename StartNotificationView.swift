//
//  StartNotificationView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct StartNotificationView: View {
    @Environment(\.theme) var theme: Theme
    

    var body: some View {
        NavigationView {
            HStack {
                Spacer()

                VStack {
                    Spacer()

                    VStack(spacing: 15) {
                        Text("Save on fees and\n stay in the know")
                            .multilineTextAlignment(.center)
                            .font(theme.typography.displayLarge)
                            .foregroundColor(theme.colors.textOnPrimary)

                        Image("Walkthrough_Counter_Custom")
                            .resizable()
                            .frame(width: 350, height: 75)
                            .foregroundColor(theme.colors.textOnPrimary)

                        Text("Turn on notifications to receive\n special offers and order updates")
                            .multilineTextAlignment(.center)
                            .font(theme.typography.body)
                            .lineSpacing(5)
                            .foregroundColor(theme.colors.textOnPrimary)

                        Button("Continue") {

                        }.subdued()
                            .frame(width: 135)
                            .offset(y: 15)
                    }
                    .frame(width: 350, height:400)

                    Spacer()
                }
                .offset(y: 30)

                Spacer()
            }
            .background(Color("Brand", bundle: .main)).ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct StartNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        StartNotificationView()
    }
}
