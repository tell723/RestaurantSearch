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
        RestaurantListView(restaurants: [Restaurant(id: "9999",
                                                    name: "琉球たれ焼肉 しゃぶしゃぶ おきなわ苑",
                                                    address: "hoge",
                                                    shopDetailMemo: "hoge detail",
                                                    logoImageUrl: "https://imgfp.hotp.jp/IMGH/76/11/P037227611/P037227611_69.jpg",
                                                    genre: Restaurant.Genre(id: "9999",
                                                                            name: "genre"))])
}
