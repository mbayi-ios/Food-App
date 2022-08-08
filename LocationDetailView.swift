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

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.73610, longitude: -73.935242), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    //@State private var selectedSegment: LocationDetailSegments = .left

    init(location: Location) {
        self.location = location
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationExamples.single)
    }
}
