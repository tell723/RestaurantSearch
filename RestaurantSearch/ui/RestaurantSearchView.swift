//
//  ContentView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import SwiftUI


struct RestaurantSearchView<ViewModel: RestaurantSearchViewModel>: View {

    @StateObject var viewModel: ViewModel
    @Environment(\.restaurantRepository) private var restaurantRepository

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isWarningVisible {
                    Text("Please input some keyword")
                        .foregroundStyle(.red)
                }

                HStack(spacing: 10) {

                    TextField("keyword", text: $viewModel.keyword) {
                    }
                    .padding(20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    NavigationLink(destination: RestaurantSearchResultView(viewModel: .init(searchKeyword: viewModel.keyword,
                                                                                           restaurantRepository: restaurantRepository)),
                                   isActive: $viewModel.isResultPresented) {
                        EmptyView()
                    }
                    Button(action: viewModel.onSearchButtonTapped) {
                        Text("search")
                    }
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    RestaurantSearchView(viewModel: .init())
        .environment(\.restaurantRepository, MockedRestaurantRepository())
}
