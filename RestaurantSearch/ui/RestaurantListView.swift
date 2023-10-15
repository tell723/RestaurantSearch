//
//  RestaurantListView.swift
//  RestaurantSearch
//
//  Created by Terumu Watanabe on 2023/10/10
//
//

import SwiftUI

struct RestaurantListView: View {

    @State var restaurants: [Restaurant]

    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                NavigationLink(destination: Text(restaurant.name)) {
                    RestaurantCellView(restaurant: restaurant)
                }
            }
        }
    }
}




#Preview {
    NavigationStack {
        RestaurantListView(restaurants: [Restaurant(id: "9999",
                                                    name: "hoge",
                                                    address: "hoge",
                                                    shopDetailMemo: "hoge detail",
                                                    logoImageUrl: "",
                                                    genre: Restaurant.Genre(id: "",
                                                                            name: "genre"))])
    }
}


#Preview("landscape left" ,traits: .landscapeLeft) {
    NavigationStack {
        RestaurantListView(restaurants: [Restaurant(id: "9999",
                                                    name: "hoge",
                                                    address: "hoge",
                                                    shopDetailMemo: "hoge detail",
                                                    logoImageUrl: "",
                                                    genre: Restaurant.Genre(id: "",
                                                                            name: "genre"))])
    }
}

#Preview("landscape right", traits: .landscapeRight) {
    NavigationStack {
        RestaurantListView(restaurants: [Restaurant(id: "9999",
                                                    name: "hoge",
                                                    address: "hoge",
                                                    shopDetailMemo: "hoge detail",
                                                    logoImageUrl: "",
                                                    genre: Restaurant.Genre(id: "",
                                                                            name: "genre"))])
    }
}


