//
//  HomeView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//



import SwiftUI
import VisionKit

struct HomeView: View {
    @StateObject private var searchInsideHomeView = SearchHomeViewModel()
    
    //    var categoryName: String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // 축제 보여주는 부분
                Text("축제")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                    .padding(.top, 15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(0..<10, id: \.self) { index in
                            FestivalItem(largeTitleName: "춘천마임축제")
                        }
                    }
                }
                
                // 시장 보여주는 부분
                Text("시장")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                    .padding(.top, 15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(0..<10, id: \.self) { index in
                            MarketItem(smallTitleName: "춘천중앙시장")
                        }
                    }
                }
            }
            .navigationTitle("홈")
            
            Spacer()
        }
    }
}

class SearchHomeViewModel: ObservableObject {
    @Published var searchText = ""
    // 검색 로직
}

#Preview {
    HomeView()
}

    
// Following code is for previous UI
//List {
//    NavigationLink(destination: ItemDetailView(navigationTitle: "중앙시장",
//                                               locationName: "강원도 강릉시 금성로 21",
//                                               marketDescription: "춘천중앙시장(춘천낭만시장)은 조선시대 춘천 읍내장을 계승한 전통시장이다. ‘봄이 흐르는 시내’라는 지역 이미지를 바탕으로 2010년 춘천낭만시장으로 이름을 바꾸어 특색을 만들어가고 있다.")) {
//        ItemView(name: "중앙시장", whereTheMarketIs: "강원도 강릉시 금성로 21")
//    }
//}
//}
//.navigationTitle("홈")
//.searchable(text: $searchInsideHomeView.searchText,
//        placement: .navigationBarDrawer(displayMode: .automatic))
