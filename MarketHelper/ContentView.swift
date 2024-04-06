//
//  ContentView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("즐겨찾기")
                }
            
            MorePageView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("더보기")
                }
        }
    }
}

#Preview {
    ContentView()
}
