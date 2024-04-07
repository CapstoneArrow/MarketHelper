//
//  ItemDetailMapView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI
import MapKit

struct ItemDetailMapView: View {
    var locationName: String
    var locationLatitude: CLLocationDegrees
    var locationLongitude: CLLocationDegrees
    
    var body: some View {
            HStack {
                Map {
                    Marker(locationName, coordinate: CLLocationCoordinate2D(latitude: locationLatitude, longitude: locationLongitude))
                }
            }
            .navigationTitle(locationName)
            .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ItemDetailMapView(locationName: "한림대학교", locationLatitude: 37.886734, locationLongitude: 127.740939)
}
