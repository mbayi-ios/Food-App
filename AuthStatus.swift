//
//  AuthStatus.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import Foundation
import Combine

class AuthStatus: ObservableObject {
    @Published private(set) var isAuthenticated: Bool = false

    private var cancellables: Set<AnyCancellable> = []
    private let sessionStore: SessionStore

    init(sessionStore: SessionStore) {
        self.sessionStore = sessionStore

        sessionStore.currentId
            .receive(on: DispatchQueue.main)
            .sink{ id in
                self.isAuthenticated = id != nil
            }.store(in: &cancellables)
    }
}
