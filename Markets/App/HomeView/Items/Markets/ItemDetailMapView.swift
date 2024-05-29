//
//  ItemDetailMapView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI
import MapKit

struct ItemDetailMapView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var marketName: String
    var marketLatitude: CLLocationDegrees
    var marketLongitude: CLLocationDegrees
    
    var body: some View {
        NavigationStack {
            Map {
                Marker(marketName,
                       coordinate: CLLocationCoordinate2D(latitude: marketLatitude,
                                                          longitude: marketLongitude))
            }
            .mapControls {
                MapCompass()
                MapUserLocationButton()
                    .buttonBorderShape(.circle)
                MapPitchToggle()
                    .buttonBorderShape(.circle)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("완료")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(marketName)
            .interactiveDismissDisabled(true)
        }
    }
}


#Preview {
    ItemDetailMapView(marketName: "한림대학교",
                      marketLatitude: 37.886734,
                      marketLongitude: 127.740939)
}
