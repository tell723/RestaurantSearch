//
//  APIClient.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import Foundation

struct APIClient {

    func fetchData(url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
