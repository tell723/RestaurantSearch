//
//  RestaurantSearchResultView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/23
//  
//

import SwiftUI


struct RestaurantSearchResultView<ViewModel: RestaurantSearchResultViewModel>: View {

    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            RestaurantListView(restaurants: viewModel.searchedRestaurants,
                               onRestaurantSelectedAction: viewModel.onListDataSelected(restaurant:))

            if viewModel.isFetchingData {
                ProgressView()
            }

            NavigationLink(isActive: $viewModel.isRestaurantSelected) {
                if let res = viewModel.selectedRestaurant {
                    RestaurantDetailView(restaurant: res)
                } else {
                    EmptyView()
                }
            } label: {
                EmptyView()
            }
        }
        .task(viewModel.setUp)
    }
}


#Preview {
    NavigationView {
        RestaurantSearchResultView(viewModel: .init(searchKeyword: "", restaurantRepository: MockedRestaurantRepository()))
    }
}
