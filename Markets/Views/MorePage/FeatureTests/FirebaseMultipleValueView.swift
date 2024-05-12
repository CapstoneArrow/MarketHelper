//
//  FirebaseIntegrationTest.swift
//  Markets
//
//  Created by Andy on 5/2/24.
//

// This code is only for TESTING FIREBASE INTEGRATION

import Foundation
import SwiftUI

struct FirebaseMultipleValueView: View {
    @ObservedObject var tradMarketData = TradMarketData()
    
    var body: some View {
        NavigationStack {
            List(tradMarketData.marketNames, id: \.self) { marketName in
                Text(marketName)
            }
        }
        .navigationTitle("Firebase Test")
    }
}

#Preview {
    FirebaseMultipleValueView()
}
