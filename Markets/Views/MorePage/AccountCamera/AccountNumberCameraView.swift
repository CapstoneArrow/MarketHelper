//
//  AccountNumberCameraView.swift
//  Markets
//
//  Created by Andy on 4/7/24.
//

import SwiftUI
import UIKit
import VisionKit

struct AccountNumberCameraView: View {
    @Binding var startScanning: Bool
    @Binding var scanResult: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            AccountNumberCameraViewController(startScanning: $startScanning, scanResult: $scanResult)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("완료")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    AccountNumberCameraView(startScanning: .constant(true), scanResult: .constant(""))
}

