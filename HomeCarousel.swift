//
//  HomeCarousel.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI
import Combine

struct HomeCarousel: View {
    @Environment(\.dependencies.useCases.homeCarouselUseCase) var homeCarouselUseCase: HomeCarouselUserCase

    @State private var currentIndex = 0
    @State private var imageArray = [Carousel]()

    private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    private let frameHeight = 475.0
    
    var body: some View {
        if imageArray.isEmpty {
            ProgressView()
                .frame(height: frameHeight)
                .onAppear{
                    homeCarouselUseCase.fetchHomeScreenContent()
                        .subscribe(Subscribers.Sink(receiveCompletion: { _ in }, receiveValue: { carousel in
                            self.imageArray = carousel
                        }))
                }
        } else {
            TabView(selection: $currentIndex) {
                ForEach(imageArray.indices, id: \.self) { i in
                    AsyncImage (url: URL(string: imageArray[i].imageUrl), transaction: Transaction(animation: .interactiveSpring())) {
                        phase in
                        switch phase {
                        case .empty:
                            ProgressView()

                        case .success(let resizableImage):
                            GeometryReader { geometry in
                                resizableImage
                                    .resizable()
                                    .frame(width: geometry.size.width,
                                           height: geometry.size.height,
                                           alignment: .center)
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFill()
                                    .clipped()
                            }
                        case .failure:
                            Image("HomePlaceholder")

                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: frameHeight)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: frameHeight)
            .onReceive(timer, perform: { _ in
                withAnimation {
                    currentIndex = currentIndex < imageArray.count - 1 ? currentIndex + 1 : 0
                }
            })
        }
    }
}

struct HomeCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeCarousel()
    }
}
