//
//  HomeView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI
import VisionKit

struct HomeView: View {
    @State private var showCameraScannerView = false
    @State private var isDeviceCapacity = false
    @State private var showDeviceNotCapacityAlert = false
    @State private var scanResults: String = ""
    
    var body: some View {
        NavigationStack {
            Text("홈 화면 구성")
                .navigationTitle("홈")
            
                
        }
    }
}

#Preview {
    HomeView()
}
