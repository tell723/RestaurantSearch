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

        VStack(alignment: .center, spacing: 10) {
            AsyncImage(url: URL(string: restaurant.photo.mobile.large), scale: 1)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .center) {
                    Text(restaurant.name)
                        .font(.system(size: 20, weight: .bold))
                    Text(restaurant.genre.name)
                        .font(.system(size: 12))
                }
            List {
                RestaurantDetailCellView(title: "営業時間", content: restaurant.open)
                RestaurantDetailCellView(title: "電話", content: restaurant.tel)
                RestaurantDetailCellView(title: "予算", content: restaurant.budget.average)
                RestaurantDetailCellView(title: "アクセス", content: restaurant.access)
                RestaurantDetailCellView(title: "住所", content: restaurant.address)
            }
        }
    }


    struct RestaurantDetailCellView: View {

        @State var title: String
        @State var content: String

        var body: some View {
            HStack(alignment: .top, spacing: 30) {
                    Text(title)
                        .font(.system(size: 12, weight: .bold))
                        .frame(idealWidth: 60, alignment: .leading)
                        .fixedSize()
                    Text(content)
                        .font(.system(size: 11))
                }
        }
    }
}


#Preview {
    RestaurantDetailView(restaurant: Restaurant.samples[3])
}

