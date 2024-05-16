//
//  MarketListView.swift
//  Markets
//
//  Created by Andy on 5/10/24.
//

import SwiftUI

struct MarketListView: View {
    @ObservedObject var tradMarketData = MarketNames()
    var titleOfRegion: String

    var body: some View {
        NavigationStack {
            List(tradMarketData.marketNames, id: \.self) { marketName in
                NavigationLink(destination: ItemDetailView(navigationTitle: marketName, locationName: "시장 위치")) {
                    ItemView(name: marketName, whereTheMarketIs: "주소는 여기에")
                        .padding()
                }
            }
        }
        .navigationTitle(titleOfRegion)
    }
}

#Preview {
    MarketListView(titleOfRegion: "지역 이름")
}
