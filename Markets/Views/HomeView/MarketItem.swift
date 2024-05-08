//
//  MarketItem.swift
//  Markets
//
//  Created by Andy on 5/9/24.
//

import SwiftUI

struct MarketItem: View {
    var smallTitleName: String
    
    var body: some View {
        VStack {
            NavigationLink(destination: ItemDetailView(navigationTitle: "시장 이름",
                                                       locationName: "시장 위치",
                                                       marketDescription: "춘천중앙시장(춘천낭만시장)은 조선시대 춘천 읍내장을 계승한 전통시장이다. ‘봄이 흐르는 시내’라는 지역 이미지를 바탕으로 2010년 춘천낭만시장으로 이름을 바꾸어 특색을 만들어가고 있다.")) {
                VStack(alignment: .leading) {
                    Image(smallTitleName)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(10)
                        
                    Text(smallTitleName)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
            }                                            
        }
        .padding(.leading, 15)
    }
}

#Preview {
    MarketItem(smallTitleName: "춘천중앙시장")
}
