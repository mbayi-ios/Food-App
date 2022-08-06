//
//  HomeCarouselUserCase.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation
import Combine

struct HomeCarouselUserCase {
    enum HomeCarouselError: Error {
        case fetchingError
    }
    init(homeCarouselRepository: HomeCarouselRepository) {
        self.homeCarouselRepository = homeCarouselRepository
    }

    private let homeCarouselRepository: HomeCarouselRepository

    func fetchHomeScreenContent() -> AnyPublisher<[Carousel], Error> {
        homeCarouselRepository.fetchCarouselAssetsWithPayload()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
