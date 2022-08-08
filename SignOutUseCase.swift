//
//  SignOutUseCase.swift
//  FoodApp
//
//  Created by Amby on 08/08/2022.
//

import Foundation

struct SignOutUseCase {
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    private let userRepository: UserRepository

    func signOut() {
        userRepository.signOut()
    }
}
