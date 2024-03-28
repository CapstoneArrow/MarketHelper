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
            
            MapView()
                .tabItem {
                    Image(systemName: "location.fill")
                    Text("근처")
                }
            
            MypageView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("내 정보")
                }
        }
    }
}

#Preview {
    ContentView()
}
