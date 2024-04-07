//
//  ItemView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct ItemView: View {
    var name: String // 제목
    var whereTheMarketIs: String // 시장이 있는 지역
    
    @State private var isStarred: Bool = false // 즐겨찾기 버튼 활성화 및 비활성화 (기본은 비활성화)
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                Text(whereTheMarketIs)
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
    ItemView(name: "예시 시장", whereTheMarketIs: "어딘가에 있지요")
}

