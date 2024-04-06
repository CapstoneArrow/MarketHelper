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

struct OldMapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var trackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $viewModel.region,
                    showsUserLocation: true,
                    userTrackingMode: $trackingMode)
                .mapControls {
                    MapCompass()
                    MapPitchToggle()
                }
            }
            .navigationTitle("내 근처 정보")
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
        }
    }
}

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.551416, longitude: 127.073883), // Default to a sample location
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }

    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.requestWhenInUseAuthorization()
            startReceivingLocationUpdates()
        } else {
            print("위치 서비스에 접근 할 수 없습니다. 설정에서 위치 서비스를 허용해주세요.")
        }
    }

    func startReceivingLocationUpdates() {
        locationManager?.startUpdatingLocation()
    }

    func requestCurrentLocation() {
        locationManager?.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async { [weak self] in
            self?.region.center = location.coordinate
        }
    }


    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

#Preview {
    OldMapView()
}
