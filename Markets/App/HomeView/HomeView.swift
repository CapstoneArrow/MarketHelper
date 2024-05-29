//
//  HomeView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI
import VisionKit

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // 축제 카테고리 목록
                // 축제 카테고리 리스트
                let festivalList = [("문화예술", "🎭"),
                                    ("생태자연", "🦆"),
                                    ("자연", "🌲"),
                                    ("전통역사", "🇰🇷"),
                                    ("특산물", "🥬"),
                                    ("주민화합", "👥"),
                                    ("기타", "🎸")]
                
                // 축제 보여주는 부분
                Text("축제")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                    .padding(.top, 15)
                
                // 축제 리스트 가로 스크롤
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(festivalList, id: \.0) { festival in
                            FestivalCategoryView(festivalName: festival.0, festivalEmoji: festival.1)
                        }
                        .hoverEffect()
                    }
                    .padding(.trailing, 15)
                }
                
                // 지역 보여주는 부분
                // 지역 이름 리스트
                let regionList = ["강원도", "경기도", "경상남도", "경상북도", "광주광역시", "대구광역시", "대전광역시", "부산광역시", "서울특별시", "세종특별자치시", "울산광역시", "인천광역시", "전라남도", "전라북도", "제주특별자치도", "충청남도", "충청북도"]
                
                Text("전통시장")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 15)
                    .padding(.top, 15)
                
                // 축제 리스트 가로 스크롤
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(regionList, id: \.self) { region in
                            RegionItem(smallTitleName: region)
                        }
                        .hoverEffect()
                    }
                    .padding(.trailing, 15)
                    
                }
            }
            .navigationTitle("홈")
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
