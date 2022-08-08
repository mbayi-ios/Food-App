//
//  Address.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import Foundation

struct Address: Identifiable, Decodable {
    var id: String = UUID().uuidString
    let street: String
    let city: String
    let zipcode: String
    let state: String
    let country: String

    var searchString: String {
        return "\(street)\(city)\(zipcode)\(state)\(country)"
    }
    var formattedString: String {
        return "\(street)\(city)\(state), \(zipcode),\(country)"
    }
}

struct AddressExamples {
    static let single = Address(street: "1337 Polaris Parkway", city: "Columbus", zipcode: "43235", state: "OH", country: "USA")

    static let list = [
        Address(street: "1337 Polaris Parkway", city: "Columbus", zipcode: "43235", state: "OH", country: "USA"),
        Address(street: "124 Westerville Way", city: "New York", zipcode: "72245", state: "NY", country: "USA"),
        Address(street: "498 Cambria Drive", city: "Houston", zipcode: "02943", state: "TX", country: "USA"),
        Address(street: "492 Sancus Blvd", city: "Toronto", zipcode: "12341", state: "VC", country: "CA"),
        Address(street: "Boardwalk", city: "Vancouver", zipcode: "74813", state: "WA", country: "USA"),
        Address(street: "Kentucky Rd", city: "Beirut", zipcode: "71345", state: "LB", country: "LEB")
    ]}
