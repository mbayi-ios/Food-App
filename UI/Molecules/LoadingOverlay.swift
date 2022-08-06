//
//  LoadingOverlay.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

private struct LoadingOverlay<Content>: View where Content: View {
    @Binding var isPresented: Bool
    @ViewBuilder let content: () -> Content

    var body: some View {
        content()
            .overlay(isPresented ? overlay(): nil)
    }

    func overlay() -> some View {
        ZStack {
            Color.black.opacity(0.4)
            ProgressView()
        }.ignoresSafeArea()
    }

}

extension View {
    func loadingOverlay(_ isPresented: Binding<Bool>) -> some View {
        LoadingOverlay(isPresented: isPresented) {
            self
        }
    }
}
