//
//  Restaurant.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import Foundation

struct Restaurant: Codable, Identifiable {
    var id: String
    var name: String
    var address: String
    var shopDetailMemo: String
    var logoImageUrl: String
    var genre: Genre

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case shopDetailMemo = "shop_detail_memo"
        case logoImageUrl = "logo_image"
        case genre
    }


    struct Genre: Codable, Identifiable {
        var id: String
        var name: String

        enum CodingKeys: String, CodingKey {
            case id = "code"
            case name
        }
    }
}


