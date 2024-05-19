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
                            FestivalItem(festivalName: "춘천마임축제")
                        }
                    }
                }
                
                // 지역 보여주는 부분
                // 강원도, 경기도, 경상남도, 경상북도, 광주광역시, 대구광역시, 대전광역시, 부산광역시
                // 서울특별시, 세종특별자치시, 울산광역시, 인천광역시, 전라남도, 전라북도, 제주특별자치도, 충청남도, 충청북도
                let regionList = ["강원도", "경기도", "경상남도", "경상북도", "광주광역시", "대구광역시", "대전광역시", "부산광역시", "서울특별시", "세종특별자치시", "울산광역시", "인천광역시", "전라남도", "전라북도", "제주특별자치도", "충청남도", "충청북도"]
                
                Text("지역")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                    .padding(.top, 15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(regionList, id: \.self) { region in
                            RegionItem(smallTitleName: region)
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
