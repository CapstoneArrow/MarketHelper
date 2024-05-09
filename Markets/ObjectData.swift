//
//  ObjectData.swift
//  Markets
//
//  Created by Andy on 5/5/24.
//

import Foundation

class ObjectData: Codable, Hashable {
    var 시장명: String = ""
    var 주차장보유여부: String = ""
    
    static func == (lhs: ObjectData, rhs: ObjectData) -> Bool {
        return lhs.시장명 == rhs.시장명 && lhs.주차장보유여부 == rhs.주차장보유여부
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(시장명)
        hasher.combine(주차장보유여부)
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


