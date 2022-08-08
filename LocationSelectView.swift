//
//  LocationSelectView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct LocationSelectView: View {
    @State private var selectedSegment: Segments = .left
    var body: some View {
        NavigationView {
            VStack {
                headerSection()
                bodySection()
            }
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

    var scheduleTitle: String {
        switch selectedSegment {
        case .left:
            return "Pickup Time"
        case .right:
            return "Delivery Time"
        }
    }
}

struct LocationSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelectView()
    }
}
