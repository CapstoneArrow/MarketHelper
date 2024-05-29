//
//  DeveloperInfoView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI

struct DeveloperInfoView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("TeamImage")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) {
                        Text("방향키")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        Text("2024-1 소프트웨어캡스톤디자인")
                    }
                    .padding([.leading])
                    
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading) {
                        DeveloperName(name: "최종현", dept: "AI의료융합전공")
                        DeveloperName(name: "김재원", dept: "빅데이터학과")
                        DeveloperName(name: "류태원", dept: "빅데이터학과")
                        DeveloperName(name: "최수진", dept: "바이오메디컬학과")
                        DeveloperName(name: "김세희", dept: "영어영문학과")
                    }
                    .padding([.leading])
                    Spacer()
                }
                Spacer()
            }
            .navigationTitle("개발자 정보")
        }
    }
}

struct DeveloperName: View {
    var name: String
    var dept: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title3)
                .fontWeight(.bold)
            Text(dept)
        }
        .padding()
    }
}

#Preview {
    DeveloperInfoView()
}
