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
                HomeView()
                
                // Sample Data
//                List {
//                    NavigationLink(destination: ItemDetailView()) {
//                        ItemView(name: "춘천서부시장", whereTheMarketIs: "춘천")
//                    }
//                }
            }
            .navigationTitle("즐겨찾기")
        }
    }
}

#Preview {
    FavoritesView()
}
