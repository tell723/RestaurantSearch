//
//  ContentView.swift
//  RestaurantSearch
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import SwiftUI

struct ContentView: View {

    @State var keyword: String = ""
    @State var isResultPresented = false

    var body: some View {
        NavigationView {
            HStack(spacing: 10) {
                TextField("keyword", text: $keyword) {
                }
                .padding(20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationLink(destination: RestaurantSearchResultView(searchKeyword: keyword),
                               isActive: $isResultPresented) {
                    EmptyView()
                }

                Button {
                    isResultPresented = true
                } label: {
                    Text("search")
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
