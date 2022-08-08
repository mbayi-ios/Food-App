//
//  SignInUseCase.swift
//  FoodApp
//
//  Created by Amby on 07/08/2022.
//

import Foundation
import Combine

struct SignInUseCase {
    enum SignInError: Error {
        case invalidEmail
    }

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    private let userRepository: UserRepository

    func signIn(email: String, password: String) -> AnyPublisher<Bool, Error> {
        userRepository.authenticate(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
