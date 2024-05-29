//
//  FestivalItemView.swift
//  Markets
//
//  Created by Andy on 5/20/24.
//

import SwiftUI

struct FestivalItemView: View {
    @State private var isStarred: Bool = false // 즐겨찾기 버튼 활성화 및 비활성화 (기본은 비활성화)
    @State private var imageURL: URL?
    
    var festivalName: String // 제목
    var festivalWhen: String // 시장이 있는 지역
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(festivalName)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(festivalWhen)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                isStarred.toggle() // Toggle the starred state.
            } label: {
                Image(systemName: "star.fill")
                    .foregroundColor(isStarred ? .yellow : .secondary)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    FestivalItemView(festivalName: "축제 이름",
                     festivalWhen: "언제인지는 여기에")
}
