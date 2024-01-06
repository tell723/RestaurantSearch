//
//  RestaurantDetailView.swift
//  RestaurantSearch
//
//  Created by Terumu Watanabe on 2023/10/15
//
//

import SwiftUI
import MapKit


struct RestaurantDetailView: View {

    let restaurant: Restaurant
    @State private var isMapModalPresented: Bool = false

    var body: some View {

        VStack(alignment: .center) {
            AsyncImage(url: URL(string: restaurant.photo.mobile.large), scale: 1)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .center) {
                Text(restaurant.name)
                    .font(.system(size: 20, weight: .bold))
                Text(restaurant.genre.name)
                    .font(.system(size: 12))
            }
            List {
                RestaurantDetailCellView(title: "メモ　", content: restaurant.shopDetailMemo)
                RestaurantDetailCellView(title: "営業時間", content: restaurant.open)
                RestaurantDetailCellView(title: "予算", content: restaurant.budget.average)
                RestaurantDetailCellView(title: "アクセス", content: restaurant.access)
                RestaurantDetailCellView(title: "住所", content: restaurant.address, iconName: "map") {
                    isMapModalPresented.toggle()
                }
            }
        }
        .sheet(isPresented: $isMapModalPresented, content: {
            RestaurantMapView(restaurant: restaurant)
        })
    }


    struct RestaurantDetailCellView: View {

        private var title: String
        private var content: String
        private var iconName: String
        let action: () -> Void

        init(title: String, content: String, iconName: String = "", action: @escaping () -> Void = {}) {
            self.title = title
            self.content = content
            self.iconName = iconName
            self.action = action
        }

        var body: some View {
            HStack(alignment: .top, spacing: 20) {
                Text(title)
                    .font(.system(size: 12, weight: .bold))
                    .frame(idealWidth: 60, alignment: .leading)
                    .fixedSize()
                Text(content)
                    .font(.system(size: 11))
                if !iconName.isEmpty {
                    Image(systemName: iconName)
                        .foregroundStyle(Color.blue)
                        .onTapGesture(perform: action)
                        .frame(maxHeight: .infinity)
                }
            }
        }
    }
}


#Preview {
    RestaurantDetailView(restaurant: Restaurant.samples[3])
}

