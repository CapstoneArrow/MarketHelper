//
//  ItemView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct ItemView: View {
    var name: String // 제목
    @State private var isStarred: Bool = true // 즐겨찾기 버튼 활성화 및 비활성화 (기본은 활성화)
    
    var body: some View {
        HStack {
            Text(name)
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
    ItemView(name: "연습")
}
