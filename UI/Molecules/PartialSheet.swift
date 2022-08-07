//
//  PartialSheet.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

extension  View {
    public func partialSheet<Content: View>(isPresented: Binding<Bool>, title: String, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View {
        ZStack {
            self
            PartialSheet(isPresented: isPresented, title: title, onDismiss: onDismiss) {
                content()
            }
        }
    }
}

struct PartialSheet<Content: View>: View {

    @Environment(\.theme) var theme: Theme

    var isPresented: Binding<Bool>
    var title: String
    var onDismiss: (() -> Void)?
    let content: Content

    @GestureState private var viewOffset: CGFloat = 0.0

    public init(isPresented: Binding<Bool>, title: String? = "", onDismiss: (() -> Void)? = nil, content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.title = title ?? ""
        self.onDismiss = onDismiss
        self.content = content()
    }


    public var body: some View {
        ZStack(alignment: .bottom) {
            if isPresented.wrappedValue {
                Color.black.opacity(0.33)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .zIndex(1)

                card
                    .edgesIgnoringSafeArea(.bottom)
                    .transition(.move(edge: .bottom))
                    .zIndex(2)
            }
        }
    }
    private var card: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack (alignment: .leading) {
                Button(action: dismiss) {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .font(Font.body.weight(.bold))
                        .foregroundColor(theme.colors.textDefault)
                        .frame(width: 15, height: 15)
                }
                .padding(.leading)

                Text(title)
                    .foregroundColor(theme.colors.textDefault)
                    .font(theme.typography.headingMedium)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }.padding(.vertical)
            Divider()

            content
                .transition(.move(edge: .bottom))
                .padding()
        }
        .background(theme.colors.actionSubdued)
        .offset(x: 0, y: viewOffset / pow(2, abs(viewOffset) / 100))
        .gesture(
            DragGesture()
                .updating($viewOffset)  { value, state, _ in
                    state = value.translation.height
                }
                .onEnded { value in
                    if value.predictedEndTranslation.height > 175 {
                        dismiss()
                    }
                }
        )
    }
    private func dismiss() {
        withAnimation {
            isPresented.wrappedValue = false
        }
        onDismiss?()
    }
}
