//
//  LocationCardView.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import SwiftUI

struct LocationCardView: View {
    @Environment(\.theme) var theme: Theme
    @State private var isSheetPresented: Bool = false

    private let location: Location

    init(location: Location) {
        self.location = location
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            //location title
            HStack {
                Text(location.name)
                    .font(theme.typography.headingMedium)
                    .foregroundColor(theme.colors.textDefault)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)

                captionLabel(location.distance, theme.colors.textSubdued)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            //location status
            HStack {
                if location.isOpen {
                    let openDetail = "until " + location.currentCloseTime + " . " + location.orderTimeEstimates
                    captionLabel("Open Now", theme.colors.actionPrimary)
                    captionLabel(openDetail, theme.colors.textDefault)
                } else {
                    let closedDetail = "until " + location.todayHours
                    captionLabel("Closed", theme.colors.textWarning)
                    captionLabel(closedDetail, theme.colors.textDefault)
                }
            }

            //address row
            HStack {
                Image("LocationPin", bundle: .main).renderingMode(.template)
                    .foregroundColor(theme.colors.textSubdued)
                captionLabel(location.address, theme.colors.textSubdued)
                    .lineLimit(2)
                    .lineSpacing(4)
            }

            //phone number row
            HStack {
                Image("PhoneIcon", bundle: .main).renderingMode(.template)
                    .foregroundColor(theme.colors.textSubdued)
                    captionLabel(location.phoneNumber,theme.colors.textSubdued)

                Button("View Hours") {
                    isSheetPresented = true
                }
                .link()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .fullScreenCover(isPresented: $isSheetPresented) {
                    LocationDetailView(location: location)

                }
            }

        }
    }

    fileprivate func captionLabel(_ text: String, _ color: Color) -> Text {
        return Text(text)
            .font(theme.typography.caption)
            .foregroundColor(color)
    }
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView(location: Location.init(id: "2615", name: "Location Name", phoneNumber: "+1 (000) 000-0000", isOpen: false, isDeliveryEnabled: true, isPickupEnabled: true, currentCloseTime: "10:00 PM", todayHours: "10:00 AM", pickupHours: ["Monday": "10 - 11:30AM, 8 - 10PM", "Tuesday": "10 - 11:30AM, 8 - 10PM", "Wednesday": "10 - 11:30AM, 8 - 10PM", "Thursday": "10 - 11:30AM, 8 - 10PM", "Friday": "10 - 11:30AM, 8 - 12PM", "Saturday": "Closed", "Sunday": "Closed"], deliveryHours: ["Monday": "10 - 11:30AM, 8 - 10PM", "Tuesday": "10 - 11:30AM, 8 - 10PM", "Wednesday": "10 - 11:30AM, 8 - 10PM", "Thursday": "10 - 11:30AM, 8 - 10PM", "Friday": "10 - 11:30AM, 8 - 12PM", "Saturday": "Closed", "Sunday": "Closed"], address: "103 Saint Jean Baptiste Street Drive Chicago, IL 60601", distance: "1.4 mi", orderTimeEstimates: "Pickup 35-45 min"))
    }

}

