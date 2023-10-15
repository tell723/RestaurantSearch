//
//  ContentView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import SwiftUI

struct ContentView: View {

    @State var keyword: String = ""
    @State var restaurants: [Restaurant] = []
    @State private var searchFinished = false

    var body: some View {
        NavigationView {
            HStack(spacing: 10) {
                TextField("keyword", text: $keyword) {

                }
                .padding(20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationLink(destination: RestaurantListView(restaurants: restaurants),
                               isActive: $searchFinished) {
                    Button(action: {
                        Task {
                            let restaurants = await RestaurantRepository().fetchRestaurants(keyword: keyword)
                            restaurants.forEach { print($0) }
                            self.restaurants = restaurants
                            searchFinished.toggle()
                        }
                    }, label: {
                        Text("search")
                    })
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
