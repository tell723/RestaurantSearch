//
//  RestaurantRepository.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import Foundation
import SwiftUI

protocol RestaurantRepository {
    func fetchRestaurants(keyword: String) async -> [Restaurant]
}

struct RestaurantRepositoryDefault: RestaurantRepository {
    func fetchRestaurants(keyword: String) async -> [Restaurant] {
        let queryItems = [
            URLQueryItem(name: "key", value: Constants.hpGourmetSearchApiKey),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "keyword", value: keyword)
        ]
        guard let url = URL(string: Constants.hpGourmetSearchApiUrl)?.queryItemAdded(qeuryItems: queryItems) else {
            print("invalid url")
            return []
        }
        do {
            let data = try await APIClient().fetchData(url: url)
            let result = try JSONDecoder().decode(HpGourmetSearchAPIResponse.self, from: data).results
            return result.restaurants
        } catch {
            print(error)
            return []
        }
    }
}


fileprivate struct RestaurantRepositoryEnvironmentKey: EnvironmentKey {
    static var defaultValue: RestaurantRepository = RestaurantRepositoryDefault()
}


extension EnvironmentValues {
    var restaurantRepository: RestaurantRepository {
        get { self[RestaurantRepositoryEnvironmentKey.self] }
        set { self[RestaurantRepositoryEnvironmentKey.self] = newValue }
    }
}


extension URL {
    func queryItemAdded(qeuryItems: [URLQueryItem]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: self.baseURL != nil) else {
            return nil
        }
        components.queryItems = (components.queryItems ?? []) + qeuryItems
        return components.url
    }
}
