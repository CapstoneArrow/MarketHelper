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
            if !singleViewModel.listObject.isEmpty {
                VStack {
                    ForEach(singleViewModel.listObject, id: \.self) { object in
                        VStack {
                            Text(object.전통시장데이터)
                            Text(object.주차장정보데이터)
                        }
                        .padding()
                    }
                }
            } else {
                Text("Place to display our value")
                    .padding()
                    .background(Color.gray)
            }
            
            
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
