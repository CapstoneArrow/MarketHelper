//
//  ItemDetailView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI

struct ItemDetailView: View {
    @State private var showingSheet = false
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var navigationTitle: String
    var locationName: String

    var body: some View {
        NavigationStack {
            ScrollView {
                // iPad and others view
                if sizeClass == .regular {
                    HStack {
                        Image("춘천중앙시장")
                            .resizable()
                            .scaledToFit()
//                            .clipShape(Circle())
                            .frame(width: 300)
                            .padding()
                        
                        }
                        .background(Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.1)
                            .cornerRadius(10))
                    // iPhone View
                } else {
                    VStack {
                        Image("춘천중앙시장")
                            .resizable()
                            .scaledToFit()
//                            .clipShape(Circle())
                            .frame(width: 300)
                            .padding(.top)
                        
                        Button {
                            showingSheet = true
                        } label: {
                            Text("지도")
                        }
                        .sheet(isPresented: $showingSheet) {
                            ItemDetailMapView(locationName: "한림대학교",
                                              locationLatitude: 37.886734,
                                              locationLongitude: 127.740939)
                        }
                        
                    }
                    .background(Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .cornerRadius(10))
                }
            }
            .navigationTitle(navigationTitle)
        }
    }
}

#Preview {
    ItemDetailView(navigationTitle: "시장 이름", locationName: "시장 위치")
}

