//
//  SessionStore.swift
//  FoodApp
//
//  Created by Amby on 07/08/2022.
//

import Foundation
import Combine

struct SessionStore {
    private static let customIdKey = "customer_id"
    private var keyStore: KeyStore
    var currentId = CurrentValueSubject<Int?, Never>(nil)

    init(keyStore: KeyStore ) {
        self.keyStore = keyStore
        currentId.send(storedId())
    }

    func store(customerId: Int) {
        keyStore.set(value: customerId, for: SessionStore.customIdKey)
        currentId.send(customerId)
    }

    func storedId() -> Int? {
        let idObject = keyStore.get(SessionStore.customIdKey)

        if idObject != nil {
            return idObject as? Int
        }

        return nil
    }

    func clear() {
        keyStore.clearValue(for: SessionStore.customIdKey)
        currentId.send(nil)
    }


}
