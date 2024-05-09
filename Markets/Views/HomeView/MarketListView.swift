//
//  MarketListView.swift
//  Markets
//
//  Created by Andy on 5/10/24.
//

import SwiftUI

struct MarketListView: View {
    var titleOfRegion: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(0..<10, id: \.self) { region in
                        ItemView(name: "시장 이름", whereTheMarketIs: "주소는 여기에")
                            .padding()
                    }
                }
            }
            .navigationTitle(titleOfRegion)
        }
    }
}

#Preview {
    MarketListView(titleOfRegion: "지역 이름")
}
