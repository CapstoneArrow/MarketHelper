//
//  AccountNumberCameraView.swift
//  MarketHelper
//
//  Created by Andy on 3/28/24.
//

import SwiftUI

struct AccountNumberCameraView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(maxWidth:.infinity, maxHeight: 300)
                
                Spacer().frame(height: 80)
                
                Label("계좌번호 인식", systemImage: "camera.viewfinder")
                    .font(.title)
                Text("인식된 계좌번호 없음")
                    .bold()
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
            .navigationTitle("계좌번호 인식")
        }
    }
}

#Preview {
    AccountNumberCameraView()
}
