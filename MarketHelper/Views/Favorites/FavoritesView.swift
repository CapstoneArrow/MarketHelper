//
//  FavoritesView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct FavoritesView: View {
    @State var isStarred: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                // Sample Data
                List {
                    
                    NavigationLink(destination: ItemMapView(locationName: "한림대학교 공학관", locationLatitude: 37.886329, locationLongitude: 127.735745)) {
                        ItemView(name: "한림대학교 공학관")
                    }
                    
                    NavigationLink(destination: ItemMapView(locationName: "춘천중앙시장", locationLatitude: 37.878070, locationLongitude: 127.725662)) {
                        ItemView(name: "춘천중앙시장")
                    }
                }
            }
            .navigationTitle("즐겨찾기")
        }
    }
}

#Preview {
    FavoritesView()
}
