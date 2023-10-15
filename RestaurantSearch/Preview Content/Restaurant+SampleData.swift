//
//  Restaurant+SampleData.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/15
//  
//
import Foundation
import SwiftUI

extension Restaurant {
    static var samples = getSampleData()
    static var sample = samples.first!

    static private func getSampleData() -> [Restaurant] {
        guard let url = Bundle.main.url(forResource: "hp_api_sample", withExtension: "json") else {
            fatalError("could not find json file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load json file")
        }
        guard let res = try? JSONDecoder().decode(HpGourmetSearchAPIResponse.self, from: data) else {
            fatalError("failed to decode json file")
        }
        return res.results.restaurants
    }
}
