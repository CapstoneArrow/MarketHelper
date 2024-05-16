//
//  FirebaseImageViewTest.swift
//  Markets
//
//  Created by Andy on 5/16/24.
//

import SwiftUI

struct FirebaseImageViewTest: View {
    let imageName: String
    @State private var imageURL: URL?
    
    var body: some View {
        Group {
            if let url = imageURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            getImageURL(for: imageName) { url in
                self.imageURL = url
            }
        }
    }
}

#Preview {
    FirebaseImageViewTest(imageName: "춘천중앙시장")
}
