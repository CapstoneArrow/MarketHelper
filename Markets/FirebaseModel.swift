//
//  FirebaseModel.swift
//  Markets
//
//  Created by Andy on 5/16/24.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class MarketInfo: ObservableObject {
    @Published var marketNames: [String] = [] // 시장명
    @Published var marketAddresses: [String] = [] // 시장 도로명 주소
    @Published var marketLatitude: [Double] = [] // 위도
    @Published var marketLongitude: [Double] = [] // 경도
    @Published var isThereToilet: [String] = [] // 화장실 보유 여부
    @Published var marketWhichCard: [String] = [] // 사용 가능 상품권
    @Published var isThereParkingLot: [String] = [] // 주차장 보유 여부
    
    private let tradMarketRef: DatabaseReference
    
    init() {
        let database = Database.database().reference()
        tradMarketRef = database.child("전통시장데이터")
        
        tradMarketRef.observe(.childAdded) { [weak self] snapshot in
            guard let self = self else { return }
            
            if let marketData = snapshot.value as? [String: Any],
               let marketName = marketData["시장명"] as? String?,
               let unwrappedMarketName = marketName,
               !unwrappedMarketName.isEmpty,
               !self.marketNames.contains(unwrappedMarketName),
               
               let address = marketData["소재지도로명주소"] as? String?,
               let unwrappedAddress = address,
               !unwrappedAddress.isEmpty,
               
               let latitude = marketData["Latitude"] as? Double,
               let longitude = marketData["Longitude"] as? Double,
               let toilet = marketData["공중화장실보유여부"] as? String,
               let parking = marketData["주차장보유여부"] as? String,
               let card = marketData["사용가능상품권"] as? String {
                self.marketNames.append(unwrappedMarketName)
                self.marketAddresses.append(unwrappedAddress)
                self.marketLatitude.append(latitude)
                self.marketLongitude.append(longitude)
                self.isThereToilet.append(toilet)
                self.isThereParkingLot.append(parking)
                self.marketWhichCard.append(card)
            }
            
        }
    }
}
