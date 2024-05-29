//
//  FestivalItem.swift
//  Markets
//
//  Created by Andy on 5/9/24.
//

import SwiftUI

struct FestivalCategoryView: View {
    var festivalName: String
    var festivalEmoji: String
    
    var body: some View {
        VStack {
            NavigationLink(destination: FestivalListView(titleOfFestivalType: festivalName)) {
                #if os(iOS)
                VStack(alignment: .leading) {
                    // 축제 관련 버튼
                    ZStack {
                        Rectangle()
                            .fill(Color.secondary.opacity(0.3))
                            .frame(width: 155, height: 155)
                            .cornerRadius(20)
                        Text(festivalEmoji)
                            .font(.system(size: 80))
                    }
                    
                    // 축제 이름
                    Text(festivalName)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                #endif
                    
                #if os(visionOS)
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 155, height: 155)
                            .cornerRadius(5)
                        Text(festivalEmoji)
                            .font(.system(size: 80))
                    }
                    
                    // 축제 이름
                    Text(festivalName)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                #endif
            }
        }
        .padding(.leading, 15)
    }
}

#Preview {
    FestivalCategoryView(festivalName: "문화예술",
                           festivalEmoji: "😃")
}
