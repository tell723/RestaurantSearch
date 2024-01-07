//
//  Constants.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/03
//  
//

import Foundation

struct Constants {
    static let hpGourmetSearchApiUrl = Bundle.main.infoDictionary?["HP_GOURMET_SEARCH_API_URL"] as? String ?? ""
    static let hpGourmetSearchApiKey = Bundle.main.infoDictionary?["HP_GOURMET_SEARCH_API_KEY"] as? String ?? ""
}
