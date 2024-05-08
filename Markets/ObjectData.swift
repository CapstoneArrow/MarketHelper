//
//  ObjectData.swift
//  Markets
//
//  Created by Andy on 5/5/24.
//

import Foundation

class ObjectData: Codable, Hashable {
    var 시장명: String = ""
    var 소재지도로명주소: String = ""
    
    static func == (lhs: ObjectData, rhs: ObjectData) -> Bool {
        return lhs.시장명 == rhs.시장명 && lhs.소재지도로명주소 == rhs.소재지도로명주소
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(시장명)
        hasher.combine(소재지도로명주소)
    }
}

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}


