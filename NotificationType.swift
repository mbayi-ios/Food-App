//
//  NotificationType.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation

public enum NotificationType{
    case pickupReady
    case deliveryDispatched

    public var metadata: (identifier: String, title: String, body: String) {
        switch self {
        case .pickupReady:
            return (identifier: "pickup.ready",
                    title: "Pickup Notification",
                    body: "your order is now ready for pickup"
            )

        case .deliveryDispatched:
            return (identifier: "delivery.dispatched",
                   title: "delivery notification",
                   body: "Your delivery is now being delivered"
            )
        }
    }
}
