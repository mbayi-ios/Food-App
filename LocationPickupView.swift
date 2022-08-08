//
//  LocationPickupView.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import SwiftUI

struct LocationPickupView: View {
    @Environment(\.theme) var theme: Theme

    @State var pickupLocation: String = ""
    @State private var selectedId: String = ""

    var body: some View {
        VStack {
            FormField(text: $pickupLocation, title: "Pickup Location", placeholder: "pickup location") {
            }
            .padding()

            VStack (alignment: .leading) {
                Text("Select Location")
                    .font(theme.typography.headingSmall)

                List(LocationExamples.list, id: \.id) { location in
                    HStack {
                        Button("Location") {   print("location") }
                        .radio(id: "1", selectedId: $selectedId)
                        LocationCardView(location: location)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture { selectedId = location.id }
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 25, trailing: 10))
                }
                .listStyle(PlainListStyle())
            }
            .padding()
        }
    }
}

struct LocationPickupView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickupView()
    }
}
