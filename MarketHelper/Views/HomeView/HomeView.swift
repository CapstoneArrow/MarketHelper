//
//  HomeView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI
import VisionKit

struct HomeView: View {
    @StateObject private var searchInsideHomeView = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Sample Data
                List {
                    NavigationLink(destination: ItemDetailView()) {
                        ItemView(name: "한림대학교 공학관", whereTheMarketIs: "춘천시")
                    }
                    
                    NavigationLink(destination: ItemDetailView()) {
                        ItemView(name: "춘천서부시장", whereTheMarketIs: "춘천시")
                    }
                    
                    NavigationLink(destination: ItemDetailView()) {
                        ItemView(name: "춘천중앙시장", whereTheMarketIs: "춘천시")
                    }
                }
            }
            .navigationTitle("홈")
            .searchable(text: $searchInsideHomeView.searchText,
                        placement: .navigationBarDrawer(displayMode: .automatic))
        }
        
    }
}

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    // 검색 로직
}

#Preview {
    HomeView()
}
