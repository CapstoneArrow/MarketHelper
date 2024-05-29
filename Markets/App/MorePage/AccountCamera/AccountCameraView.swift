//
//  AccountCameraView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI
import VisionKit

struct AccountMainCameraView: View {
    @State private var showCameraScannerView = false
    @State private var isDeviceCapacity = false
    @State private var showDeviceNotCapacityAlert = false
    @State private var scanResults: String = ""
    @State private var isCopyButtonTapped = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                HStack {
                    Text(scanResults)
                        .padding(7)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .frame(minWidth: 250, maxWidth: .infinity)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Button {
                        UIPasteboard.general.string = scanResults
                        isCopyButtonTapped.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isCopyButtonTapped.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "doc.on.doc.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        .scaleEffect(isCopyButtonTapped ? 1.2 : 1.0)
                        .padding()
                    }
                    .animation(.interpolatingSpring, value: isCopyButtonTapped)
                }
                .background(Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                    .cornerRadius(10))
                .padding()
                
                Spacer()
                
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
                    .padding()
                }
                
                Spacer()
                Spacer()
            }
            .sheet(isPresented: $showCameraScannerView) {
                AccountNumberCameraView(startScanning: $showCameraScannerView, scanResult: $scanResults)
            }
            .alert("카메라에 접근할 수 없습니다. 설정에서 카메라 접근을 허용해주세요.", isPresented: $showDeviceNotCapacityAlert, actions: {})
            .onAppear {
                isDeviceCapacity = (DataScannerViewController.isSupported && DataScannerViewController.isAvailable)
            }
            .navigationTitle("계좌번호 인식")
        }
    }
}


#Preview {
    AccountMainCameraView()
}


