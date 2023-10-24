//
//  RestaurantSearchResultView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/23
//  
//

import SwiftUI


struct RestaurantSearchResultView: View {

    let searchKeyword: String
    @State var searchedRestaurants: [Restaurant] = []
    @State var selectedRestaurant: Restaurant?
    @State var isRestaurantSelected: Bool = false

    var body: some View {
        RestaurantListView(restaurants: self.searchedRestaurants) { selectedRestaurant in
            self.selectedRestaurant = selectedRestaurant
            isRestaurantSelected = true
        }
        .task {
            Task {
                let restaurants = await RestaurantRepository().fetchRestaurants(keyword: searchKeyword)
                self.searchedRestaurants = restaurants
            }
        }
        if let res = self.selectedRestaurant {
            NavigationLink(destination: RestaurantDetailView(restaurant: res), isActive: $isRestaurantSelected) {
                EmptyView()
            }
        }
    }
}
