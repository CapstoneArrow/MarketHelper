//
//  WeatherKitTest.swift
//  Markets
//
//  Created by Andy on 5/3/24.
//

import SwiftUI
import WeatherKit
import CoreLocation

// Turns out I need to call WeatherKit API on Apple's Developer Website...

struct WeatherKitTest: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Testing WeatherKit")
            }
            .navigationTitle("WeatherKit Test")
        }
    }
}

#Preview {
    WeatherKitTest()
}
