//
//  DeliveryAddressCell.swift
//  FoodApp
//
//  Created by Amby on 09/08/2022.
//

import SwiftUI

struct DeliveryAddressCell: View {
    @Environment(\.theme) var theme: Theme

    @Binding private var selectedAddress: Address?

    private let address: Address
    private let onPress: () -> Void

    init(address: Address, selectedAddress: Binding<Address?>, onPress: @escaping () -> Void ) {
        self.address = address
        self._selectedAddress = selectedAddress
        self.onPress = onPress
    }
    var body: some View {
        Button{
            selectedAddress = address
            onPress()
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(address.street)
                        .font(theme.typography.body)
                        .textCase(.uppercase)
                    Spacer()
                }
                HStack {
                    Text("\(address.city) \(address.state), \(address.zipcode), \(address.country)")
                        .font(theme.typography.caption)
                    Spacer()
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(theme.colors.actionSubduedPressed)
            .cornerRadius(2)
        }
    }
}

struct DeliveryAddressCell_Previews: PreviewProvider {
    @State static var selectedAddress: Address? = AddressExamples.single

    static var previews: some View {
        DeliveryAddressCell(address: AddressExamples.single, selectedAddress: $selectedAddress) {
            print("location card pressed")
        }
    }
}
