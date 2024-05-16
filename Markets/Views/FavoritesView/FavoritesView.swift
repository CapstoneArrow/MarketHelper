//
//  FavoritesView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var searchInsideHomeView = SearchFavoritesViewModel()
    @State var isStarred: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink(destination: ItemDetailView(marketName: "한림대학교",
                                                               marketAddress: "어디어디 주소",
                                                               marketLatitude: 37.886734,
                                                               marketLongitude: 127.740939,
                                                               isThereToilet: "Y",
                                                               isThereParkingLot: "Y",
                                                               marketWhichCard: "온누리상품권")) {
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
