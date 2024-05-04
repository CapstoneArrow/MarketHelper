//
//  FirebaseIntegrationTest.swift
//  Markets
//
//  Created by Andy on 5/2/24.
//

// This code is only for TESTING FIREBASE INTEGRATION

import Foundation
import SwiftUI

struct FirebaseTestView: View {
    @StateObject
    var viewModel = FirebaseTestViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.value != nil {
                    Text(viewModel.value!)
                        .padding()
                        .background(Color.gray)
                } else {
                    Text("Place to display our value")
                        .padding()
                        .background(Color.gray)
                }
                
                Button {
                    viewModel.readValue()
                } label: {
                    Text("Read")
                }
            }
            .navigationTitle("Firebase Test")
        }
    }
}

#Preview {
    FirebaseTestView()
}
