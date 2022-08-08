//
//  Location.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import Foundation

struct Location: Decodable {
    var id: String = UUID().uuidString
    let name: String
    let phoneNumber: String
    let isOpen: Bool
    let isDeliveryEnabled: Bool
    let isPickupEnabled: Bool
    let currentCloseTime: String
    let todayHours: String
    let pickupHours: [String: String]
    let deliveryHours: [String: String]
    let address: String
    let distance: String
    let orderTimeEstimates: String
}

struct LocationExamples {
    static let single = Location(
        id: "2614",
        name: "Fulton & Pearl",
        phoneNumber: "+1 (205) 219-1225",
        isOpen: true, isDeliveryEnabled: true,
        isPickupEnabled: true,
        currentCloseTime: "10:00 PM",
        todayHours: "10:00 AM",
        pickupHours: ["Monday": "10 - 11:30AM, 8 - 10PM", "Tuesday": "10 - 11:30AM, 8 - 10PM", "Wednesday": "10 - 11:30AM, 8 - 10PM", "Thursday": "10 - 11:30AM, 8 - 10PM", "Friday": "10 - 11:30AM, 8 - 12PM", "Saturday": "Closed", "Sunday": "Closed"],
        deliveryHours: ["Monday": "10 - 11:30AM", "Tuesday": "10 - 11:30AM", "Wednesday": "10 - 11:30AM", "Thursday": "10 - 11:30AM", "Friday": "10 - 11:30AM", "Saturday": "Closed", "Sunday": "Closed"], address: "1234 Saint Jean Baptiste Street Drive Chicago, IL 60601",
        distance: "0.4 mi",
        orderTimeEstimates: "Pickup 35-45 min"
    )

    static let list = [single,
                       Location(
                        id: "2615",
                        name: "Location Name",
                        phoneNumber: "+1 (000) 000-0000",
                        isOpen: false,
                        isDeliveryEnabled: true,
                        isPickupEnabled: true,
                        currentCloseTime: "10:00 PM",
                        todayHours: "10:00 AM",
                        pickupHours: ["Monday": "10 - 11:30AM, 8 - 10PM", "Tuesday": "10 - 11:30AM, 8 - 10PM", "Wednesday": "10 - 11:30AM, 8 - 10PM", "Thursday": "10 - 11:30AM, 8 - 10PM", "Friday": "10 - 11:30AM, 8 - 12PM", "Saturday": "Closed", "Sunday": "Closed"],
                        deliveryHours: ["Monday": "10 - 11:30AM, 8 - 10PM", "Tuesday": "10 - 11:30AM, 8 - 10PM", "Wednesday": "10 - 11:30AM, 8 - 10PM", "Thursday": "10 - 11:30AM, 8 - 10PM", "Friday": "10 - 11:30AM, 8 - 12PM", "Saturday": "Closed", "Sunday": "Closed"], address: "103 Saint Jean Baptiste Street Drive Chicago, IL 60601",
                        distance: "1.4 mi",
                        orderTimeEstimates: "Pickup 35-45 min"
                       )]
}
