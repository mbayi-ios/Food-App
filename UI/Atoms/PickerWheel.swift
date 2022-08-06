//
//  PickerWheel.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

struct PickerWheel: View {

    @Environment(\.theme) var theme: Theme

    @Binding var selection: String

    @State private var leftSelection: String = ""
    @State private var rightSelection: String = ""

    let leftcolumn: [String]
    let rightColumn: [String]

    var body: some View {
        let firstBinding = Binding(
            get: {self.leftSelection },
            set: {
                self.leftSelection = $0
                selection = "\(leftSelection) \(rightSelection)"
            }
        )

        let secondBinding = Binding(
            get: { self.rightSelection },
            set: {
                self.rightSelection = $0
                selection = "\(leftSelection) \(rightSelection)"
            }
        )
        GeometryReader{
            geometry in
            HStack(spacing: 0) {
                createPickerColumn(selection: firstBinding, column: leftcolumn, geometry: geometry)
                createPickerColumn(selection: secondBinding, column: rightColumn, geometry: geometry)
            }
        }
    }
    private func createPickerColumn(selection: Binding<String>, column: [String], geometry: GeometryProxy) -> some View {
        Picker("", selection: selection) {
            ForEach(column, id: \.self) { item in
                Text(item)
                    .tag(item)
                    .font(theme.typography.displayLarge)
            }
        }
        .frame(width: geometry.size.width/2, height: geometry.size.height, alignment: .center)
        .compositingGroup()
        .clipped()
    }
}

struct PickerWheel_Previews: PreviewProvider {

    static let leftColumn = ["Today", "Sat, Jun 11", "Sun, Jun 12", "Mon, June 12", "Today", "Sat, Jun 11", "Sun, Jun 12", "Mon, June 12"]
    static let rightColumn = ["ASAP", "4:45pm - 5:00pm", "5:00pm - 5:15pm", "5:15pm - 5:30pm", "ASAP", "4:45pm - 5:00pm", "5:00pm - 5:15pm", "5:15pm - 5:30pm"]

    @State static var selection: String = ""

    static var previews: some View {
        PickerWheel(selection: $selection, leftcolumn: leftColumn, rightColumn: rightColumn)
    }
}
