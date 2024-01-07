//
//  RestaurantSearchViewModel.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2024/01/06
//  
//

import Foundation

class RestaurantSearchViewModel: ObservableObject {
    @Published var keyword = ""
    @Published var isResultPresented = false
    @Published private(set) var isWarningVisible = false

    func onSearchButtonTapped() {
        guard !keyword.isEmpty else {
            isWarningVisible = true
            return
        }
        isWarningVisible = false
        isResultPresented = true
    }
}
