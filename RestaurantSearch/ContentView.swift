//
//  ContentView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    let restaurants = await RestaurantRepository().fetchRestaurants(keyword: "焼き肉")
                    restaurants.forEach { print($0) }
                }
            }) {
                Text("Restaurant Search")
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
