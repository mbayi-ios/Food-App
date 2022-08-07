//
//  UserRepository.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation
import Combine

struct UserRepository {
    private let network: NetworkClient
    //private let sessionStore: SessionStore

    init(network: NetworkClient) {
        self.network = network
    }

    func createAccount(firstName: String, lastName: String, emailAddress: String, phoneNumber: Int, password: String) ->AnyPublisher<Bool, Error> {
        let request = PostSignUp(payload: PostSignUp.Payload(email: emailAddress,
                                                             password: password,
                                                             firstName: firstName,
                                                             lastName: lastName,
                                                             phone: phoneNumber))
        return network.perform(request).tryMap { response in
            return true
        }.eraseToAnyPublisher()
    }
}
