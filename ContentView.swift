//
//  ContentView.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
    //@Environment(\.dependencies.state) var appState

    @AppStorage("didShowWalkthrough", store: .standard) var didShowWalkthrough = false
    private var isOnboardingPresented: Binding<Bool> {
        Binding {
            !didShowWalkthrough
        } set: { value in
            didShowWalkthrough = !value
        }
    }
    var body: some View {
        RootNavigationView()
            .fullScreenCover(isPresented: isOnboardingPresented, content: {
                NavigationView {
                    StartView()
                }
            })
            .theme(Theme(colors: Colors(with: Color("Brand", bundle: .main))))
            //.environmentObject(appState.authStatus)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
