//
//  FestivalItem.swift
//  Markets
//
//  Created by Andy on 5/9/24.
//

import SwiftUI

struct FestivalItem: View {
    var largeTitleName: String
    
    var body: some View {
        VStack {
            NavigationLink(destination: ItemDetailView(navigationTitle: "시장 이름", locationName: "시장 위치")) {
                VStack(alignment: .leading) {
                    // 축제 관련 이미지
                    Image(largeTitleName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .cornerRadius(10)
                    
                    // 축제 이름
                    Text(largeTitleName)
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
    FestivalItem(largeTitleName: "춘천마임축제")
}
