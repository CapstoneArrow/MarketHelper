//
//  ObjectData.swift
//  Markets
//
//  Created by Andy on 5/5/24.
//

// DELETE THIS CODE
// Won't be needing this code anymore

import Foundation

class ObjectData: Codable, Hashable {
//    var Latitude: Double = 0.0
//    var Longitude: Double = 0.0
//    var 공중화장실보유여부: String = ""
//    var 사용가능상품권: String = ""
//    var 소재지도로명주소: String = ""
//    var 소재지지번주소: String = ""
//    var 시장명: String = ""
//    var 주차장보유여부: String = ""
    
    var 전통시장데이터: String = ""
    var 주차장정보데이터: String = ""
    var 지역축제정보데이터: String = ""
    
    static func == (lhs: ObjectData, rhs: ObjectData) -> Bool {
//        return lhs.Latitude == rhs.Latitude &&
//               lhs.Longitude == rhs.Longitude &&
//               lhs.공중화장실보유여부 == rhs.공중화장실보유여부 &&
//               lhs.사용가능상품권 == rhs.사용가능상품권 &&
//               lhs.소재지도로명주소 == rhs.소재지도로명주소 &&
//               lhs.소재지지번주소 == rhs.소재지지번주소 &&
//               lhs.시장명 == rhs.시장명 &&
//               lhs.주차장보유여부 == rhs.주차장보유여부
        
        return lhs.전통시장데이터 == rhs.전통시장데이터 &&
               lhs.주차장정보데이터 == rhs.주차장정보데이터 &&
               lhs.지역축제정보데이터 == rhs.지역축제정보데이터
    }
    
    func hash(into hasher: inout Hasher) {
//        hasher.combine(Latitude)
//        hasher.combine(Longitude)
//        hasher.combine(공중화장실보유여부)
//        hasher.combine(사용가능상품권)
//        hasher.combine(소재지도로명주소)
//        hasher.combine(소재지지번주소)
//        hasher.combine(시장명)
//        hasher.combine(주차장보유여부)
        
        hasher.combine(전통시장데이터)
        hasher.combine(주차장정보데이터)
        hasher.combine(지역축제정보데이터)
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


