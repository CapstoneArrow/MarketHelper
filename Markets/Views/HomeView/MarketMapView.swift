//
//  MarketMapView.swift
//  Markets
//
//  Created by Andy on 5/8/24.
//

import SwiftUI
import MapKit

struct MarketMapView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            Map()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("완료")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    MarketMapView()
}
