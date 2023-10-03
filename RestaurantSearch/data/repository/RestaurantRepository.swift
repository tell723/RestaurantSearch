//
//  RestaurantRepository.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import Foundation

protocol RestaurantRepositoryProtocol {
    func fetchRestaurants(keyword: String) async -> [Restaurant]
}

struct RestaurantRepository: RestaurantRepositoryProtocol {
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


extension URL {
    func queryItemAdded(qeuryItems: [URLQueryItem]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: self.baseURL != nil) else {
            return nil
        }
        components.queryItems = (components.queryItems ?? []) + qeuryItems
        return components.url
    }
}
