//
//  SegmentPicker.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

enum Segments {
    case left
    case right
}
struct SegmentPicker: View {
    let leftTitle: String
    let rightTitle: String

    @Binding var selected: Segments

    @Namespace private var animation

    @Environment(\.theme) var theme: Theme

    var body: some View {
        VStack {
            HStack {
                makeSegmentButton(title: leftTitle, segment: .left)
                makeSegmentButton(title: rightTitle, segment: .right)
            }
        }
        .padding(3)
        .background(theme.colors.actionSubdued)
        .cornerRadius(.greatestFiniteMagnitude)
        .padding(.horizontal, 15)
    }
    private func makeSegmentButton(title: String, segment: Segments) -> some View {
        Button {
            withAnimation(.interactiveSpring()) {
                selected = segment
            }
        } label: {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 34)
                .font(theme.typography.caption)
                .foregroundColor(selected == segment ? theme.colors.textOnPrimary : theme.colors.textDefault)
        }
        .background(
            ZStack {
                if selected == segment {
                    theme.colors.actionPrimary
                        .cornerRadius(.greatestFiniteMagnitude)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            }
        )
    }
}

struct SegmentPicker_Previews: PreviewProvider {
    @State static var selectedSegment: Segments = .left

    static var previews: some View {
        ZStack {
            //Color(.gray).edgesIgnoringSafeArea(.all)
            SegmentPicker(leftTitle: "Pickup", rightTitle: "Delivery", selected: $selectedSegment)
        }

    }
}
