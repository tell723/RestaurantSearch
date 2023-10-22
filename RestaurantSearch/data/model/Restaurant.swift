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
    var access: String
    var open: String
    var budget: Budget
    var shopDetailMemo: String
    var logoImageUrl: String
    var genre: Genre
    var photo: Photo
    var lat: Double
    var lng: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case access
        case open
        case budget
        case shopDetailMemo = "shop_detail_memo"
        case logoImageUrl = "logo_image"
        case genre
        case photo
        case lat
        case lng
    }


    struct Budget: Codable {
        var average: String

        enum CodingKeys: String, CodingKey {
            case average
        }
    }


    struct Genre: Codable, Identifiable {
        var id: String
        var name: String

        enum CodingKeys: String, CodingKey {
            case id = "code"
            case name
        }
    }


    struct Photo: Codable {
        var mobile: ImageUrl
        var pc: ImageUrl

        enum CodingKeys: String, CodingKey {
            case mobile
            case pc
        }


        struct ImageUrl: Codable {
            var large: String
            var small: String

            enum CodingKeys: String, CodingKey {
                case large = "l"
                case small = "s"
            }
        }
    }
}


