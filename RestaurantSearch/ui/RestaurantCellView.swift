//
//  RestaurantCellView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/14
//  
//

import SwiftUI


struct RestaurantCellView: View {

    @State var restaurant: Restaurant

    var body: some View {
        HStack {

            AsyncImage(url: URL(string: restaurant.logoImageUrl))
                .clipShape(RoundedRectangle(cornerRadius: 5))
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(size: 15, weight: .bold, design: .default))
                Text(restaurant.genre.name)
                    .font(.system(size: 12))
            }
            .padding(.leading)
        }
    }
}


#Preview("cell", traits: .sizeThatFitsLayout) {
    RestaurantCellView(restaurant: Restaurant.sample)
}
