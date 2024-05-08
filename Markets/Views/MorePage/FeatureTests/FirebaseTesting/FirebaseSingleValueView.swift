//
//  FirebaseIntegrationTest.swift
//  Markets
//
//  Created by Andy on 5/2/24.
//

// This code is only for TESTING FIREBASE INTEGRATION

import Foundation
import SwiftUI

struct FirebaseSingleValueView: View {
    @StateObject
    var viewModel = FirebaseSingleValueViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.object != nil {
                    VStack {
                        Text(viewModel.object!.시장명)
                            .padding()
                            .background(Color.gray)
                    }
                    
                    VStack {
                        Text(viewModel.object!.소재지도로명주소)
                            .padding()
                            .background(Color.gray)
                    }
                } else {
                    Text("Place to display our value")
                        .padding()
                        .background(Color.gray)
                }
                
                Button {
                    viewModel.readObject()
                } label: {
                    Text("Read")
                }
                
                if !viewModel.listObject.isEmpty {
                    VStack {
                        ForEach(viewModel.listObject, id: \.self) { object in
                            VStack {
                                Text(object.시장명)
                                Text(object.소재지도로명주소)
                            }
                        }
                    }
                } else {
                    Text("Place to display our value")
                        .padding()
                        .background(Color.gray)
                }
                
                Button {
                    viewModel.observeListObject()
                } label: {
                    Text("Read")
                }
                
            }
            .navigationTitle("Firebase Test")
        }
    }
}

#Preview {
    FirebaseSingleValueView()
}
