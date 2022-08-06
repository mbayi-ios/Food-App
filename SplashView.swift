//
//  SplashView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct SplashView: View {
    @Binding var splashCompleted: Bool

    @Environment(\.theme) var theme: Theme

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                ZStack {
                    Image("Walkthrough_Logo_Circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .shadow(color: .black.opacity(0.08), radius: 0.1, x: 0, y: 4)
                    Image("Brand")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                }
                .offset(y: -20)
                Text("Welcome to the \(filteredDisplayName()) App!")
                    .frame(width: 345)
                    .multilineTextAlignment(.center)
                    .font(theme.typography.displayLarge)
                    .foregroundColor(theme.colors.textOnPrimary)
                Spacer()
            }
            Spacer()
        }
        .background(Color("Brand", bundle: .main)).ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    splashCompleted = true
                }
            }
        }
    }

    private func filteredDisplayName() -> String {
        var filterName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
        let filterOut = " App"

        if let range = filterName.range(of: filterOut) {
            filterName.removeSubrange(range)
        }
        return filterName

    }
}

struct SplashView_Previews: PreviewProvider {
    @State static var splashCompleted = true
    static var previews: some View {

        SplashView(splashCompleted: $splashCompleted)
    }
}
