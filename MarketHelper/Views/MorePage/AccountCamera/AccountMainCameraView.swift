//
//  AccountMainCameraView.swift
//  MarketHelper
//
//  Created by Andy on 3/31/24.
//

import SwiftUI
import VisionKit

struct AccountMainCameraView: View {
    @State private var showCameraScannerView = false
    @State private var isDeviceCapacity = false
    @State private var showDeviceNotCapacityAlert = false
    @State private var scanResults: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Text("계좌번호 인식 결과")
                    .font(.title2)
                    .padding()
                
                VStack {
                    Text(scanResults)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                    
                    Button {
                        UIPasteboard.general.string = scanResults
                    } label: {
                        HStack {
                            Image(systemName: "doc.on.doc.fill")
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                            Text("복사하기")
                                .font(.subheadline)
                        }
                        
                    }
                }
                
                Button {
                    if isDeviceCapacity {
                        self.showCameraScannerView = true
                    } else {
                        self.showDeviceNotCapacityAlert = true
                    }
                } label: {
                    HStack {
                        Image(systemName: "camera.viewfinder")
                            .font(.largeTitle)
                        Text("인식하기")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.green)
                    .padding()
                    
                }
                
                Spacer()
                Spacer()
            }
            .sheet(isPresented: $showCameraScannerView) {
                AccountNumberCameraView(startScanning: $showCameraScannerView, scanResult: $scanResults)
            }
            .alert("설정에서 카메라 접근을 허용해주세요.", isPresented: $showDeviceNotCapacityAlert, actions: {})
            .onAppear {
                isDeviceCapacity = (DataScannerViewController.isSupported &&                         DataScannerViewController.isAvailable)
            }
            .navigationTitle("계좌번호 인식")
        }
    }
}


#Preview {
    AccountMainCameraView()
}
