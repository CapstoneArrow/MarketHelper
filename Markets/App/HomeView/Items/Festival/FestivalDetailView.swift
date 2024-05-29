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
    
    // View에 쓰여질 변수
    var festivalName: String // 축제명
    var festivalHow: String // 개최방식
    var festivalWhen: String // 개최기간
    var festivalWhere: String // 개최장소
    var festivalType: String // 축제유형
    var festivalPhoneNumber: String // 연락처
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // iPad and others view
                if sizeClass == .regular {
                    VStack {
                        Image(festivalName)
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
                            
                            Text(festivalName)
                        }
                        .padding(.bottom)
                        
                        // 축제 유형
                        HStack {
                            Image(systemName: "movieclapper.fill")
                            
                            Text(festivalType)
                        }
                        .padding(.bottom)
                        
                        // 개최 기간
                        HStack {
                            Image(systemName: "calendar")
                            
                                .foregroundColor(.red)
                            Text(festivalWhen)
                        }
                        .padding(.bottom)
                        
                        // 개최 방식
                        HStack {
                            if festivalHow == "대면" {
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(.purple)
                                Text(festivalHow)
                            } else {
                                Image(systemName: "person.slash.fill")
                                    .foregroundColor(.purple)
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(.purple)
                                Text("비대면, 대면")
                            }
                        }
                        .padding(.bottom)
                        
                        // 개최 장소
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                            Text(festivalWhere)
                        }
                        .padding(.bottom)
                        
                        // 연락처
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.green)
                            Text(festivalPhoneNumber)
                        }
                        .padding(.bottom)
                        
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                } else {
                    // iPhone View
                    VStack {
                        Image(festivalName)
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
                            
                            Text(festivalName)
                        }
                        .padding(.bottom)
                        
                        // 축제 유형
                        HStack {
                            Image(systemName: "movieclapper.fill")
                            
                            Text(festivalType)
                        }
                        .padding(.bottom)
                        
                        // 개최 기간
                        HStack {
                            Image(systemName: "calendar")
                            
                                .foregroundColor(.red)
                            Text(festivalWhen)
                        }
                        .padding(.bottom)
                        
                        // 개최 방식
                        HStack {
                            if festivalHow == "대면" {
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(.purple)
                                Text(festivalHow)
                            } else {
                                Image(systemName: "person.slash.fill")
                                    .foregroundColor(.purple)
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(.purple)
                                Text("비대면, 대면")
                            }
                        }
                        .padding(.bottom)
                        
                        // 개최 장소
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                            Text(festivalWhere)
                        }
                        .padding(.bottom)
                        
                        // 연락처
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.green)
                            Text(festivalPhoneNumber)
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
    FestivalDetailView(festivalName: "춘천마임축제",
                       festivalHow: "대면축제",
                       festivalWhen: "5월 중",
                       festivalWhere: "중도동 357-41 일대",
                       festivalType: "문화예술",
                       festivalPhoneNumber: "033-250-3072")
}
