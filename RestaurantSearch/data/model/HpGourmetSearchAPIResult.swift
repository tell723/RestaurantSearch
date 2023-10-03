//
//  HpGroumetSearchAPIResponse.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/03
//  
//

import Foundation

struct HpGourmetSearchAPIResult: Codable {
    var resultsAvailable: Int
    var resultsReturned: String
    var resultsStart: Int
    var restaurants: [Restaurant]

    enum CodingKeys: String, CodingKey {
        case resultsAvailable = "results_available"
        case resultsReturned = "results_returned"
        case resultsStart = "results_start"
        case restaurants = "shop"
    }
}
