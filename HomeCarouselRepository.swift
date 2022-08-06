//
//  HomeCarouselRepository.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation
import Combine

struct HomeCarouselRepository {
    private let network: NetworkClient

    init(network: NetworkClient) {
        self.network = network
    }
    func fetchCarouselAssetsWithPayload() -> AnyPublisher<[Carousel], Error> {
        let request = HomeScreenImageFetch(payload: nil)

        return network.perform(request).tryMap { response in
            return response.carousel
        }.eraseToAnyPublisher()
    }
}
