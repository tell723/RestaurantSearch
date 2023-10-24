//
//  RestaurantSearchResultView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/23
//  
//

import SwiftUI


struct RestaurantSearchResultView: View {

    var searchKeyword: String
    @State var searchedRestaurants: [Restaurant] = []

    var body: some View {
        RestaurantListView(restaurants: self.searchedRestaurants)
            .task {
                Task {
                    let restaurants = await RestaurantRepository().fetchRestaurants(keyword: searchKeyword)
                    self.searchedRestaurants = restaurants
                }
            }
    }
}
