//
//  RestaurantListView.swift
//  RestaurantSearch
//
//  Created by Terumu Watanabe on 2023/10/10
//
//

import SwiftUI

struct RestaurantListView: View {

    var restaurants: [Restaurant]
    var onRestaurantSelectedAction: ((Restaurant) -> Void)?

    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                RestaurantCellView(restaurant: restaurant)
                    .onTapGesture {
                        guard let action = onRestaurantSelectedAction else { return }
                        action(restaurant)
                    }
            }
        }
    }
}




#Preview {
    NavigationStack {
        RestaurantListView(restaurants: Restaurant.samples)
    }
}


#Preview("landscape left" ,traits: .landscapeLeft) {
    NavigationStack {
        RestaurantListView(restaurants: Restaurant.samples)
    }
}

#Preview("landscape right", traits: .landscapeRight) {
    NavigationStack {
        RestaurantListView(restaurants: Restaurant.samples)
    }
}


