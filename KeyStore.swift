//
//  KeyStore.swift
//  FoodApp
//
//  Created by Amby on 07/08/2022.
//

import Foundation

protocol KeyStore {
    func set(value: Any, for key: String) -> Void
    func get(_ key: String) -> Any?
    func clearValue(for key: String) -> Void

}

struct DefaultKeyStore: KeyStore {
    func get(_ key: String) -> Any?{
        UserDefaults.standard.object(forKey:key)
    }

    func set(value: Any, for key: String){
        UserDefaults.standard.set(value, forKey: key)
    }

    func clearValue(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
