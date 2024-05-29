//
//  MarketListView.swift
//  Markets
//
//  Created by Andy on 5/10/24.
//

import SwiftUI

struct MarketListView: View {
    @ObservedObject var marketData = MarketInfo()
    
    var titleOfRegion: String

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    ForEach(marketData.marketNames.indices, id: \.self) { index in
                        NavigationLink(destination: ItemDetailView(marketName: marketData.marketNames[index],
                                                                   marketAddress: marketData.marketAddresses[index],
                                                                   marketLatitude: marketData.marketLatitude[index],
                                                                   marketLongitude: marketData.marketLongitude[index],
                                                                   isThereToilet: marketData.isThereToilet[index],
                                                                   isThereParkingLot: marketData.isThereParkingLot[index],
                                                                   marketWhichCard: marketData.marketWhichCard[index])) {
                            ItemView(name: marketData.marketNames[index],
                                     whereTheMarketIs: marketData.marketAddresses[index])
                            .padding()
                            .hoverEffect()
                        }
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
