//
//  Restaurant.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import Foundation

struct Restaurant: Codable {
    var name: String
    var address: String
    var shopDetailMemo: String

    enum CodingKeys: String, CodingKey {
        case name
        case address
        case shopDetailMemo = "shop_detail_memo"
    }
}
