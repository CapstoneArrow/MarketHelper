//
//  FirebaseSingleValueView.swift
//  Markets
//
//  Created by Andy on 5/9/24.
//

import SwiftUI

struct FirebaseSingleValueView: View {
    @StateObject var singleViewModel = FirebaseSingleValueViewModel()
    
    var body: some View {
        VStack {
            if singleViewModel.value != nil {
                Text(singleViewModel.value!)
                    .padding()
                    .background(Color.gray)
            }
            Text("Place to display our value")
                .padding()
                .background(Color.gray)
            
            Button {
                singleViewModel.readValue()
            } label: {
                Text("Read")
            }
        }
    }
}

#Preview {
    FirebaseSingleValueView()
}
