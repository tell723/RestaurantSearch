//
//  RestaurantMapView.swift
//  RestaurantSearch
//
//  Created by Terumu Watanabe on 2023/10/22
//
//

import SwiftUI
import MapKit


struct RestaurantMapView: View {

    @Environment(\.dismiss) var dismiss
    var restaurant: Restaurant

    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: restaurant.lat
                                                                           , longitude: restaurant.lng),
                                            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            Map(position: Binding.constant(MapCameraPosition.region(region))) {
                Marker(restaurant.name,
                       coordinate: CLLocationCoordinate2D(latitude: restaurant.lat,
                                                          longitude: restaurant.lng))
            }
            .border(Color(UIColor.lightGray))
        }
    }
}
