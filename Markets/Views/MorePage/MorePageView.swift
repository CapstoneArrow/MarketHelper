//
//  MorePageView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI

struct MorePageView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("쏠쏠한 기능")) {
                    NavigationLink(destination: AccountMainCameraView()) {
                        HStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.primary)
                            Text("계좌번호 인식")
                        }
                    }
                    
                    NavigationLink(destination: NearbyView()) {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.blue)
                            Text("내 근처 정보")
                        }
                    }
                }
                
                Section(header: Text("정보")) {
                    NavigationLink(destination: DeveloperInfoView()) {
                        HStack {
                            Image(systemName: "hammer.fill")
                                .foregroundColor(.secondary)
                            Text("개발자 정보")
                        }
                    }
                }
                
                // 기능 프로토타입 및 테스트를 위한 내역
                // Firebase 연동 테스트 용
                // 각 기능들 테스트에만 사용하고 삭제 예정
                Section(header: Text("기능 테스트")) {
                    NavigationLink(destination: FirebaseSingleValueView()) {
                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.red)
                            Text("Firebase Single Value")
                        }
                    }
                    
                    NavigationLink(destination: FirebaseMultipleValueView()) {
                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.red)
                            Text("Firebase Multiple Value")
                        }
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

