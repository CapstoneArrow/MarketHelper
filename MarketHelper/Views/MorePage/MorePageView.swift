//
//  MypageView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct MorePageView: View {
    @State private var somethingIsOn = false
    @State private var somethingElseIsOn = false
    @State private var anotherThingIsOn = false
    
    @State private var howMuch = 0.0
    @State private var amount = 0.0
    @State private var quantity = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                        
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                    } header: {
                        Text("Photos")
                    }
                    
                    Button("Tap me") {
                        
                    }
                }
            }
            .navigationTitle("더보기")
        }
    }
}

#Preview {
    MorePageView()
}
