//
//  StartLocationView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct StartLocationView: View {
    @Environment(\.theme) var theme: Theme

    @State private var isShowingNotificationView = false

    var body: some View {
        NavigationView {
            VStack() {
                Spacer()

                makeIllustration()

                VStack(spacing: 15) {
                    Text("Get Local")
                        .multilineTextAlignment(.center)
                        .font(theme.typography.displayLarge)

                    Text("Enable your location to order from\n nearby {Restaurant name} locations")
                        .multilineTextAlignment(.center)
                        .font(theme.typography.body)
                        .lineSpacing(5)

                    NavigationLink(destination: StartNotificationView(), isActive: $isShowingNotificationView) {
                        Button(action: {
                            LocationService.shared.requestUserLocation {
                                self.isShowingNotificationView = true
                            }
                        }) {
                            Text("Lets Go")
                        }
                        .primary()
                        .frame(width: 135)
                        .minimumScaleFactor(0.4)
                    }
                    .offset(y: 15)
                }
                .frame(width: 250, height: 200)

                Spacer(minLength: 215)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension StartLocationView  {
    private func makeIllustration() -> some View {
        ZStack {
            Image("Walkthrough_Map_Location")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .position(x: 100, y: 100)

            Image("Walkthrough_Map_Pin")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .position(x: 100, y: 100)
                .foregroundColor(Color("Brand", bundle: .main))
        }
        .frame(width: 200, height: 200)
    }

    private func filteredDisplayName() -> String {
        var filterName = Bundle.main.object(forInfoDictionaryKey: "CFBudneldisplayName") as? String ?? ""
        let filterOut = " App"

        if let range = filterName.range(of: filterOut) {
            filterName.removeSubrange(range)
        }
        return filterName
    }
}

struct StartLocationView_Previews: PreviewProvider {
    static var previews: some View {
        StartLocationView()
    }
}
