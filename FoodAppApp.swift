//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

@main
struct FoodAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State private var didShowSplash = false

    var body: some Scene {
        WindowGroup {
            if didShowSplash {
                ContentView()
            } else {
                SplashView(splashCompleted: $didShowSplash)
            }

        }
    }
}
