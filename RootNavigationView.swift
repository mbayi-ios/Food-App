//
//  RootNavigationView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct RootNavigationView: View {
    @Environment(\.theme) var theme: Theme

    @State var tab: Tab = .home
    @State var orderingPresented = false

    var body: some View {
        selectedView()
            .fullScreenCover(isPresented: $orderingPresented) {
                LocationSelectView()
            }
            .safeAreaInset(edge: .bottom) {
                tabBar()
            }
    }

    private func tabBar() -> some View {
        VStack {
            ScrollView {
                HomeView()
            }
            Spacer()
            Divider().foregroundColor(theme.colors.borderSubdued)
            HStack {
                TabItem(
                    isSelected: tab == .home,
                    title: "Home", icon: theme.icons.tabs.home,
                    iconSelected: theme.icons.tabs.homeSelected){
                        tab = .home
                    }
                TabItem(
                    isSelected: tab == .home,
                    title: "Order", icon: theme.icons.tabs.order){
                        orderingPresented = true
                    }
                TabItem(
                    isSelected: tab == .account,
                    title: "Account", icon: theme.icons.tabs.account,
                    iconSelected: theme.icons.tabs.accountSelected){
                        tab = .account
                    }
            }
        }
    }

    private func selectedView() -> some View {
        switch tab {
        case .home:
            return Text("Home")

        case .account:
            return Text("Account")
        }
    }
}


extension RootNavigationView {
    enum Tab {
        case home
        case account
    }

    private struct TabItem: View {
        @Environment(\.theme) var theme: Theme

        private let isSelected: Bool
        private let action: () -> Void
        private let title: String
        private let iconDefault: Image
        private let iconSelected: Image

        init (
            isSelected: Bool,
            title: String,
            icon: Image,
            iconSelected: Image? = nil,
            action: @escaping () -> Void) {
                self.action = action
                self.isSelected = isSelected
                self.iconDefault = icon
                self.iconSelected = iconSelected ?? icon
                self.title = title
            }

        var body: some View {
            Button {
                action()
            } label: {
                VStack {
                    icon()
                    Text(title).font(
                        .system(size: 12)
                            .bold())
                }
            }
            .foregroundColor(tint())
            .frame(maxWidth: .infinity)
            .frame(height: 48)
        }

        private func tint() -> Color {
            isSelected ? theme.colors.actionPrimary : theme.colors.textDefault
        }
        private func icon() -> Image {
            isSelected ? iconSelected : iconDefault
        }

    }
}

struct RootNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigationView()
    }
}
