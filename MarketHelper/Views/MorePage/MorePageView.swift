//
//  MypageView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct MorePageView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("쏠쏠한 기능")) {
                    NavigationLink(destination: AccountNumberCameraView()) {
                        HStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.primary)
                            Text("계좌번호 인식")
                        }
                    }
                }
                
                NavigationLink(destination: DeveloperInfoView()) {
                    HStack {
                        Image(systemName: "hammer.fill")
                            .foregroundColor(.blue)
                        Text("개발자 정보")
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
