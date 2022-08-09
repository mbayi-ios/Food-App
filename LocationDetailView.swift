//
//  LocationDetailView.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.dismiss) var dismiss

    private let location: Location
    private let dayKeys = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -1.286389, longitude: 36.817223), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    @State private var selectedSegment: LocationDetailSegments = .left

    init(location: Location) {
        self.location = location
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                closeButton()
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 220, alignment: .topLeading)
            }.background(
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            )
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading) {
                    textLabel(location.name, theme.typography.displayMedium, theme.colors.textDefault)

                    textLabel(location.isOpen ? "Open Now" : "Closed Now", theme.typography.caption, location.isOpen ? theme.colors.actionPrimary : theme.colors.textCritical)
                }

                HStack {
                    Image("PhoneIcon", bundle: .main).renderingMode(.template)
                    Button(location.address) { print("location link")}.link()
                }
            }.padding()

            LocationDetailSegmentPicker(leftTitle: "Store Hours", middleTitle: "Delivery Hours", rightTitle: "Pickup Hours", selected: $selectedSegment)
            bodySection()
            Spacer()
        }
    }
    private func bodySection() -> some View {
        Group {
            switch selectedSegment {
            case .left, .right:
                displayHours(selectedHours: location.pickupHours)

            case .mid:
                displayHours(selectedHours: location.deliveryHours)
            }
        }
    }

    private func displayHours(selectedHours: [String: String]) -> some View {
        VStack {
            ForEach(dayKeys, id: \.self) { day in
                GeometryReader { geometry  in
                    HStack {
                        Text(day)
                            .frame(width: geometry.size.width / 3, alignment: .leading)
                        Text(selectedHours[day] ?? "Closed")
                    }.font(theme.typography.body)
                }
            }.frame(height: 25)
        }.padding()
    }

    private func closeButton() -> some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .fill(theme.colors.textOnPrimary)
                    .frame(width: 44, height: 44)
                Image(systemName: "xmark")
                    .font(theme.typography.headingMedium)
                    .tint(.black)
            }
        }
    }

    fileprivate func textLabel(_ text: String, _ font: Font, _ color: Color) -> Text {
        return Text(text).font(font)
            .foregroundColor(color)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationExamples.single)
    }
}
