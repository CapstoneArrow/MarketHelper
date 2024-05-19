//
//  FestivalItem.swift
//  Markets
//
//  Created by Andy on 5/9/24.
//

import SwiftUI

struct FestivalItem: View {
    var festivalName: String
    
    var body: some View {
        VStack {
            NavigationLink(destination: ItemDetailView(marketName: "한림대학교",
                                                       marketAddress: "어디어디 주소",
                                                       marketLatitude: 37.886734,
                                                       marketLongitude: 127.740939,
                                                       isThereToilet: "Y",
                                                       isThereParkingLot: "Y",
                                                       marketWhichCard: "온누리상품권")) {
                VStack(alignment: .leading) {
                    // 축제 관련 이미지
                    Image(festivalName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .cornerRadius(10)
                    
                    // 축제 이름
                    Text(festivalName)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    // 축제 날짜
                    Text("5월 9일")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.leading, 15)
    }
}

#Preview {
    FestivalItem(festivalName: "춘천마임축제")
}
