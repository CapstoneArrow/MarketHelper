//
//  FestivalDetailView.swift
//  Markets
//
//  Created by Andy on 5/19/24.
//

import SwiftUI

struct FestivalDetailView: View {
    @State private var imageURL: URL?
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var festivalName: String // 이미지 이름 역할도 함
//    var marketAddress: String
//    var marketLatitude: Double
//    var marketLongitude: Double
//    var isThereToilet: String
//    var isThereParkingLot: String
//    var marketWhichCard: String
    
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
                    
                    
                } else {
                    // iPhone View
                    VStack {
                        Image("춘천마임축제")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .cornerRadius(10)
                            .padding()
                        
                        

                    }
                    
                    // 축제에 대한 정보들
                    VStack(alignment: .leading) {
                        // 축제명
                        HStack {
                            Image(systemName: "info.circle")
                            
                            Text("춘천마임축제")
                        }
                        .padding(.bottom)
                        
                        // 축제 유형
                        HStack {
                            Image(systemName: "movieclapper.fill")
                            
                            Text("문화예술")
                        }
                        .padding(.bottom)
                        
                        // 개최 기간
                        HStack {
                            Image(systemName: "calendar")
                            
                                .foregroundColor(.red)
                            Text("5월 중")
                        }
                        .padding(.bottom)
                        
                        // 개최 방식
                        HStack {
                            Image(systemName: "person.3.fill")
                                .foregroundColor(.purple)
                            Text("대면 축제")
                        }
                        .padding(.bottom)
                        
                        // 개최 장소
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                            Text("중도동 357-41 일대")
                        }
                        .padding(.bottom)
                        
                        // 연락처
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.green)
                            Text("033-250-3072")
                        }
                        .padding(.bottom)
                        
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .navigationTitle(festivalName)
        }
    }
}

#Preview {
    FestivalDetailView(festivalName: "춘천마임축제")
}
