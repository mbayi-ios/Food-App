//
//  LocationDeliveryView.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import SwiftUI

struct LocationDeliveryView: View {
    @Environment(\.theme) var theme: Theme

    @FocusState private var isFieldFocused: Bool

    @State private var addressFieldText: String = ""
    @State private var aptFieldText: String = ""
    @State private var selectedAddress: Address?

    var body: some View {
        VStack {
            headerSection()
            bodySection()
        }
    }

    private func headerSection() -> some View {
        HStack {
            FormField(text: $addressFieldText, title: "Your Address", placeholder: "Enter your address") {
                print("commited your address")
            }
            .focused($isFieldFocused)

            FormField(text: $aptFieldText, title: "Apt", placeholder: "Optional") {
                print("commited apt")
            }
            .frame(maxWidth: 75)
        }
        .padding()

    }

    var filteredAddressList: [Address] {
        AddressExamples.list.filter {
            $0.searchString.lowercased().contains(addressFieldText.lowercased())
        }
    }

   private func bodySection() -> some View {
        Group {
            if(selectedAddress != nil) {
                SelectedDeliveryRestaurantCell(location: LocationExamples.single)
                    .padding(.horizontal, 15)
            }

            List(filteredAddressList) { address in
                DeliveryAddressCell(address: address, selectedAddress: $selectedAddress) {
                    isFieldFocused = false
                    addressFieldText = selectedAddress?.formattedString ?? ""
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))

            }
            .listStyle(.plain)
            .padding(.horizontal, 15)
            .animation(.interactiveSpring(), value: addressFieldText == "")
        }
    }
    
}

struct LocationDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeliveryView()
    }
}
