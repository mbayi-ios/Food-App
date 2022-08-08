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
    private let sessionStore: SessionStore

    init(
        network: NetworkClient,
        sessionStore: SessionStore) {
        self.network = network
            self.sessionStore = sessionStore
    }

    func authenticate(email: String, password: String) -> AnyPublisher<Bool, Error> {
        let request = PostSignIn(payload: PostSignIn.Payload(email: email, password: password))

        return network.perform(request)
            .receive(on: DispatchQueue.main)
            .tryMap { response in
                print("hello")
                return true
            }.eraseToAnyPublisher()
    }

    func signOut() {
        sessionStore.clear()
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
