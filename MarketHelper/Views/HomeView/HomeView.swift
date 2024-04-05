//
//  HomeView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI
import VisionKit

struct HomeView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink(destination: HomeDetailView()) {
                        ItemView(name: "시장 이름", whereTheMarketIs: "어딘가에 있지요")
                    }
                }
            }
            .navigationTitle("홈")
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
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
