//
//  FirebaseImageModel.swift
//  Markets
//
//  Created by Andy on 5/16/24.
//

import Foundation
import FirebaseStorage

func getImageURL(for imageName: String, completion: @escaping (URL?) -> Void) {
    let storageRef = Storage.storage().reference().child("전통시장이미지데이터(강원도)/\(imageName).jpg")
    
    storageRef.downloadURL { url, error in
        if let error = error {
            print("Error getting image URL: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        // Return the image URL
        guard let url = url else {
            completion(nil)
            return
        }
        
        completion(url)
    }
}


