//
//  LocationDetailSegmentPicker.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import SwiftUI

enum LocationDetailSegments {
    case left
    case mid
    case right
}

struct LocationDetailSegmentPicker: View {
    @Environment(\.theme) var theme: Theme

    private let leftTitle: String
    private let middleTitle: String
    private let rightTitle: String

    @Binding var selected: LocationDetailSegments

    @Namespace private var animation

    init(leftTitle: String, middleTitle: String, rightTitle: String, selected: Binding<LocationDetailSegments>) {
        self.leftTitle = leftTitle
        self.middleTitle = middleTitle
        self.rightTitle = rightTitle
        self._selected = selected
    }

    var body: some View {
        VStack  {
            HStack {
                makeSegmentButton(title: leftTitle, segment: .left)
                makeSegmentButton(title: middleTitle, segment: .mid)
                makeSegmentButton(title: rightTitle, segment: .right)
            }
            Divider()
        }
        .background(theme.colors.textOnPrimary)
    }

    private func makeSegmentButton(title: String, segment: LocationDetailSegments) -> some View {
        Button {
            withAnimation(.interactiveSpring()) {
                selected = segment
            }
        } label: {
            VStack {
                Text(title)
                    .frame(maxWidth: .infinity, minHeight: 34)
                    .font(theme.typography.body)
                    .foregroundColor(selected == segment ? theme.colors.textDefault : theme.colors.textSubdued)
            }
        }
        .background(
            ZStack {
                if selected == segment {
                    theme.colors.actionPrimary
                        .matchedGeometryEffect(id: "Tab", in: animation)
                        .offset(y: 22.5)
                        .frame(width: .infinity, height: 5, alignment: .center)
                }
            }
        )
    }

}

struct LocationDetailSegmentPicker_Previews: PreviewProvider {
    @State static var selectedSegment: LocationDetailSegments = .left
    static var previews: some View {
        LocationDetailSegmentPicker(leftTitle: "Store Hours", middleTitle: "Delivery Hours", rightTitle: "Pickup Hourse", selected: $selectedSegment)
    }
}
