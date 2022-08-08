//
//  LocationSelectView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct LocationSelectView: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.dependencies.useCases.signOutUseCase) var signOutUseCase
    @EnvironmentObject var authStatus: AuthStatus

    @Environment(\.dismiss) var dismiss

    @State private var selectedSegment: Segments = .left
    @State private var isSheetPresented: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                headerSection()
                bodySection()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: closeButton(), trailing:trailingNavigationButton())
            .footer {
                footerSection()
            }
            .partialSheet(isPresented: $isSheetPresented, title: scheduleTitle, content: {
                schedulePickerSheet()
            })
        }
    }

    private func headerSection() -> some View {
        SegmentPicker(leftTitle: "Pickup", rightTitle: "Delivery", selected: $selectedSegment)
    }

    private func bodySection() -> some View {
        Group {
            switch selectedSegment {
            case .left:
                LocationPickupView()
            case .right:
                LocationDeliveryView()
            }
        }
    }

    @State private var schedule: String = "ASAP"

    var scheduleTitle: String {
        switch selectedSegment {
        case .left:
            return "Pickup Time"
        case .right:
            return "Delivery Time"
        }
    }

    private  func footerSection() -> some View {
        Group {
            PickerField(
                text: $schedule,
                title: scheduleTitle,
                leftIcon: {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(theme.colors.interactiveDefault)
                        .frame(width: 14, height: 14, alignment: .center)
                },
                onPress: {
                    withAnimation(.spring(response: 0.35, dampingFraction: 1)) {
                        isSheetPresented.toggle()
                    }
                })
            Button("Order Now") {
                print("order now pressed")
            }
            .primary()
            .disabled(true)
        }
    }

    private func closeButton() -> some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(theme.typography.headingSmall)
                .tint(.black)
        }
    }

    private func trailingNavigationButton() -> some View {
        /*if authStatus.isAuthenticated {
            return AnyView(signOutButton())
        } else {
            return AnyView(signInButton())
        }*/
        NavigationLink(destination: SignInView()) {
            Text("SIGN IN")
                .font(theme.typography.buttonLinkBold)
                .tint(theme.colors.actionPrimary)
        }
    }

    private func signOutButton() -> some View {
        Button {
            signOutUseCase.signOut()
        } label: {
            Text("SIGN OUT")
                .font(theme.typography.buttonLinkBold)
                .tint(theme.colors.actionPrimary)
        }
    }

    private func signInButton() -> some View {
        NavigationLink(destination: SignInView()) {
            Text("SIGN IN")
                .font(theme.typography.buttonLinkBold)
                .tint(theme.colors.actionPrimary)
        }
    }

    let leftColumn = ["Today", "Sat, Jun 11", "Sun, Jun 12", "Mon, June 12", "Today", "Sat, Jun 11", "Sun, Jun 12", "Mon, June 12"]
    let rightColumn = ["ASAP", "4:45pm - 5:00pm", "5:00pm - 5:15pm", "5:15pm - 5:30pm", "ASAP", "4:45pm - 5:00pm", "5:00pm - 5:15pm", "5:15pm - 5:30pm"]

    private func schedulePickerSheet() -> some View {
        Group {
            PickerWheel(selection: $schedule, leftcolumn: leftColumn, rightColumn: rightColumn)
                .frame(height: 180)

            Button("Set \(scheduleTitle)") {
                print("set schedule \(schedule)")
                isSheetPresented.toggle()
            }
            .primary()
        }
    }
}

struct LocationSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelectView()
    }
}
