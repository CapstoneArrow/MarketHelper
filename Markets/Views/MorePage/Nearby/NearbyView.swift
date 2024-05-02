//
//  NearbyView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI
import MapKit

struct NearbyView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    var body: some View {
        NavigationStack {
            VStack {
                Map(position: $cameraPosition)
                    .mapControls {
                        MapCompass()
                        MapUserLocationButton()
                            .buttonBorderShape(.circle)
                        MapPitchToggle()
                            .buttonBorderShape(.circle)
                    }
            }
            .navigationTitle("내 근처 정보")
            .onAppear {
                CLLocationManager().requestWhenInUseAuthorization()
            }
        }
    }
}

// 지도의 기본 위치와 배율을 설정
// 기본 위치 - 한림대학교 공학관
extension CLLocationCoordinate2D {
    static var defaultUserLocation: CLLocationCoordinate2D {
        return .init(latitude: 37.886329, longitude: 127.735745)
    }
}

// 기본 배율 설정
extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .defaultUserLocation,
                     latitudinalMeters: 300,
                     longitudinalMeters: 300)
    }
}

#Preview {
    NearbyView()
}
