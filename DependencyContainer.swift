//
//  DependencyContainer.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI
import Combine

struct DependencyContainer: EnvironmentKey {
    let useCases: UseCases

    static var defaultValue: Self { self.default }

    private static var `default`: Self = {
        let client = HTTPClient(environs: .development)
        let sessionStore = SessionStore(keyStore: DefaultKeyStore())
        let authStatus = AuthStatus(sessionStore: sessionStore)
        let repositories = Repositories(
            user: UserRepository(network: client, sessionStore: sessionStore),
            content: HomeCarouselRepository(network: client)
        )

        return Self (
            useCases: UseCases(repositories: repositories)
        )
    }()

    struct Repositories {
        let user: UserRepository
        let content: HomeCarouselRepository
    }

    struct UseCases {
        init(repositories: Repositories) {
            self.repositories = repositories
        }
        private let repositories: Repositories

        var signInUseCase: SignInUseCase {
            SignInUseCase(userRepository: repositories.user)
        }

        var signUpUseCase: SignUpUseCase {
            SignUpUseCase(userRepository: repositories.user)
        }

        var signOutUseCase: SignOutUseCase {
            SignOutUseCase(userRepository: repositories.user)
        }

        var homeCarouselUseCase: HomeCarouselUserCase {
            HomeCarouselUserCase(homeCarouselRepository: repositories.content)
        }
    }
}

extension EnvironmentValues {
    var dependencies: DependencyContainer {
        get { self[DependencyContainer.self] }
        set { self[DependencyContainer.self] = newValue }
    }
}

extension View {
    func inject(_ dependencies: DependencyContainer) -> some View {
        return self
            .environment(\.dependencies, dependencies)
    }
}
