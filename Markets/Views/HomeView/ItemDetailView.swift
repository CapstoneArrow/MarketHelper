//
//  ItemDetailView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI

struct ItemDetailView: View {
    @State private var imageURL: URL?
    @State private var showingSheet = false
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var marketName: String // also works as name for images
    var marketAddress: String
    var marketLatitude: Double
    var marketLongitude: Double
    var isThereToilet: String
    var isThereParkingLot: String
    var marketWhichCard: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // iPad and others view
                if sizeClass == .regular {
                    HStack {
                        Image("춘천중앙시장")
                            .resizable()
                            .scaledToFit()
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
                        Group {
                            if let url = imageURL {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 280)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .padding()
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 350)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .padding()
                                }
                            } else {
                                Image("춘천중앙시장")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 350, height: 280)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                        .onAppear {
                            getImageURL(for: marketName) { url in
                                self.imageURL = url
                            }
                        }
                        
                        
                        // 지도 보기 버튼
                        Button {
                            showingSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "map.fill")
                                Text(marketAddress)
                            }
                            .font(.headline)
                            .padding(.bottom)
                        }
                        .sheet(isPresented: $showingSheet) {
                            ItemDetailMapView(marketName: marketName,
                                              marketLatitude: marketLatitude,
                                              marketLongitude: marketLongitude)
                        }
                    }
                    
                    // 이 시장에 대한 추가 정보
                    HStack {
                        Image(systemName: "star.fill")
                        Text("추가 정보")
                    }
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.orange)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    HStack {
                        if isThereParkingLot == "Y" {
                            Spacer()
                            
                            Image(systemName: "car")
                                .font(.title)
                                .foregroundColor(.purple)
                                .background(
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .opacity(0.1)
                                        .cornerRadius(10)
                                        .frame(width: 80, height: 50))
                                .shadow(radius: 5)
                        }
                        if isThereToilet == "Y" {
                            Spacer()
                            
                            Image(systemName: "toilet.fill")
                                .font(.title)
                                .foregroundColor(.secondary)
                                .background(
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .opacity(0.1)
                                        .cornerRadius(10)
                                        .frame(width: 80, height: 50))
                                .shadow(radius: 5)
                        }
                        
                        if !(marketWhichCard == "없음") {
                            Spacer()
                            Image(systemName: "giftcard")
                                .font(.title)
                                .foregroundColor(.red)
                                .background(
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .opacity(0.1)
                                        .cornerRadius(10)
                                        .frame(width: 80, height: 50))
                                .shadow(radius: 5)
                        }
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle(marketName)
        }
    }
}


#Preview {
    ItemDetailView(marketName: "한림대학교",
                   marketAddress: "어디어디 주소",
                   marketLatitude: 37.886734,
                   marketLongitude: 127.740939,
                   isThereToilet: "Y",
                   isThereParkingLot: "Y",
                   marketWhichCard: "온누리상품권")
}
