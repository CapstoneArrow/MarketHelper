//
//  FavoritesView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var searchInsideHomeView = SearchFavoritesViewModel()
    @State var isStarred: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {                
                List {
                    NavigationLink(destination: ItemDetailView(navigationTitle: "춘천중앙시장", locationName: "춘천시")) {
                        ItemView(name: "춘천중앙시장", whereTheMarketIs: "춘천시")
                    }
                }
            }
            .navigationTitle("즐겨찾기")
            .searchable(text: $searchInsideHomeView.searchText,
                        placement: .navigationBarDrawer(displayMode: .automatic))
        }
    }
}

class SearchFavoritesViewModel: ObservableObject {
    @Published var searchText = ""
    // 검색 로직
}

#Preview {
    FavoritesView()
}
