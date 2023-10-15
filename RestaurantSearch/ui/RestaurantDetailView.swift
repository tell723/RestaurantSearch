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
    RestaurantDetailView(restaurant: Restaurant(id: "9999",
                                                    name: "琉球たれ焼肉 しゃぶしゃぶ おきなわ苑",
                                                    address: "hoge",
                                                    shopDetailMemo: "hoge detail",
                                                    logoImageUrl: "https://imgfp.hotp.jp/IMGH/76/11/P037227611/P037227611_69.jpg",
                                                    genre: Restaurant.Genre(id: "9999",
                                                                            name: "genre")
                                               )
    )
}
