//
//  RestaurantSearchResultViewModel.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2024/01/06
//  
//

import Foundation

class RestaurantSearchResultViewModel: ObservableObject {
    var restaurantRepository: RestaurantRepository?
    @Published var searchKeyword: String
    @Published var isRestaurantSelected: Bool = false
    @Published private(set) var searchedRestaurants = [Restaurant]()
    @Published private(set) var selectedRestaurant: Restaurant?
    @Published private(set) var isFetchingData: Bool = false

    init(searchKeyword: String, restaurantRepository: RestaurantRepository) {
        self.searchKeyword = searchKeyword
        self.restaurantRepository = restaurantRepository
    }

    func setUp() async {
        await fetchData()
    }

    func onListDataSelected(restaurant: Restaurant) {
        selectedRestaurant = restaurant
        isRestaurantSelected = true
    }

    private func fetchData() async {
        guard let restaurantRepository else {
            return
        }
        isFetchingData = true
        let restaurants = await restaurantRepository.fetchRestaurants(keyword: searchKeyword)
        searchedRestaurants = restaurants
        isFetchingData = false
    }
}
