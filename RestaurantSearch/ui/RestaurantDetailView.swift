//
//  RestaurantDetailView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/15
//  
//

import SwiftUI


struct RestaurantDetailView: View {

    @State var restaurant: Restaurant

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: restaurant.logoImageUrl))
            Text(restaurant.name)
            Text(restaurant.genre.name)
            Text(restaurant.shopDetailMemo)
        }
    }
}


#Preview {
    RestaurantDetailView(restaurant: Restaurant.sample)
}
