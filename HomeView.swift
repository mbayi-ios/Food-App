//
//  HomeView.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var orderingPresented = false

    var body: some View {
        VStack {
            HomeCarousel()
            VStack {
                Button(action: {
                    orderingPresented = true
                }, label: {
                    Text("Start Order")
                })
                    .primary()
                    .frame(width: 340)
                    .padding(10)
                    .fullScreenCover(isPresented: $orderingPresented){
                        LocationSelectView()
                    }
            }
            HomeLastOrder()
        }
        .clipped()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
