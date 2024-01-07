//
//  MockedRestaurantRepository.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/26
//  
//

import Foundation


struct MockedRestaurantRepository: RestaurantRepository {
    func fetchRestaurants(keyword: String) async -> [Restaurant] {
        do {
            try await Task.sleep(for: .seconds(2))
        } catch {
           debugPrint(error)
        }
        return Restaurant.samples
    }
}
