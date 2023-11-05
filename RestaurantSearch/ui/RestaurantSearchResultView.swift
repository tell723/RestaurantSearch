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
    @Environment(\.restaurantRepository) private var restaurantRepository
    @State var searchedRestaurants: [Restaurant] = []
    @State var selectedRestaurant: Restaurant?
    @State var isRestaurantSelected: Bool = false
    @State var isFetchingData: Bool = false

    var body: some View {
        ZStack {
            RestaurantListView(restaurants: self.searchedRestaurants) { selectedRestaurant in
                self.selectedRestaurant = selectedRestaurant
                isRestaurantSelected = true
            }
            .task {
                Task {
                    isFetchingData = true
                    let restaurants = await restaurantRepository.fetchRestaurants(keyword: searchKeyword)
                    self.searchedRestaurants = restaurants
                    isFetchingData = false
                }
            }

            if isFetchingData {
                ProgressView()
            }

            NavigationLink(isActive: $isRestaurantSelected) {
                if let res = selectedRestaurant {
                    RestaurantDetailView(restaurant: res)
                } else {
                    EmptyView()
                }
            } label: {
                EmptyView()
            }
        }
    }
}


#Preview {
    NavigationView {
        RestaurantSearchResultView(searchKeyword: "")
    }
    .environment(\.restaurantRepository, MockedRestaurantRepository())
}
