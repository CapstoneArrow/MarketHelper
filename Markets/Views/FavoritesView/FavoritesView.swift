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
                    NavigationLink(destination: ItemDetailView(navigationTitle: "춘천중앙시장",
                                                               locationName: "춘천시",
                                                               marketDescription: "춘천중앙시장(춘천낭만시장)은 조선시대 춘천 읍내장을 계승한 전통시장이다. ‘봄이 흐르는 시내’라는 지역 이미지를 바탕으로 2010년 춘천낭만시장으로 이름을 바꾸어 특색을 만들어가고 있다.")) {
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
