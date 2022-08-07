//
//  SignUpUseCase.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation
import Combine

struct SignUpUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func signUp(firstName: String, lastName: String, emailAddress: String , phoneNumber: Int, password: String) -> AnyPublisher<Bool, Error> {
        userRepository.createAccount(firstName: firstName, lastName: lastName, emailAddress: emailAddress, phoneNumber: phoneNumber, password: password)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
