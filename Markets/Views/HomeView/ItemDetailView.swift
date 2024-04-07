//
//  ItemDetailView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI

struct ItemDetailView: View {
    var navigationTitle: String
    var locationName: String
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if sizeClass == .regular {
                    HStack() {
                        Image("춘천중앙시장")
                            .resizable()
                            .scaledToFit()
//                            .clipShape(Circle())
                            .frame(width: 300)
                            .padding()
                        
                            
                            Text("춘천중앙시장(춘천낭만시장)은 조선시대 춘천 읍내장을 계승한 전통시장이다. ‘봄이 흐르는 시내’라는 지역 이미지를 바탕으로 2010년 춘천낭만시장으로 이름을 바꾸어 특색을 만들어가고 있다.")
                            .font(.subheadline)
                                .padding(.all, 10)
                                .frame(minWidth: 250, maxWidth: 400)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .background(Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.1)
                            .cornerRadius(10))
                } else {
                    VStack() {
                        Image("춘천중앙시장")
                            .resizable()
                            .scaledToFit()
//                            .clipShape(Circle())
                            .frame(width: 300)
                            .padding(.top)
                        
                            
                            Text("춘천중앙시장(춘천낭만시장)은 조선시대 춘천 읍내장을 계승한 전통시장이다. ‘봄이 흐르는 시내’라는 지역 이미지를 바탕으로 2010년 춘천낭만시장으로 이름을 바꾸어 특색을 만들어가고 있다.")
                                .font(.subheadline)
                                .padding(.all, 10)
                                .frame(width: 350, alignment: .center)
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

