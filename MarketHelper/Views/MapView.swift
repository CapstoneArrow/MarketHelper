//
//  MapView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

#if os(iOS)
import CoreLocationUI
#endif

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let defaultLocation = CLLocationCoordinate2D(latitude: 37.886329, longitude: 127.735745) // 공학관
    static let sampleMarket = CLLocationCoordinate2D(latitude: 37.878070, longitude: 127.725662) // 춘천중앙시장
}

struct MapView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Map {
                    Marker("한림대학교 공학관", coordinate: .defaultLocation)
                    Marker("춘천중앙시장", coordinate: .sampleMarket)
                }
                    
                #if os(iOS)
                    LocationButton(.currentLocation) {
                        print("Current Location button tapped")
                    }
                    .foregroundColor(.white)
                    .cornerRadius(90)
                    .labelStyle(.iconOnly)
                    .symbolVariant(.fill)
                    .padding()
                #endif
                
            }
            .navigationTitle("지도")
        }
    }
}

#Preview {
    MapView()
}
