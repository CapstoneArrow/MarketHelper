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

class FestivalInfo: ObservableObject {
    @Published var festivalName: [String] = [] // 축제명
    @Published var festivalHow: [String] = [] // 개최방식
    @Published var festivalWhen: [String] = [] // 개최기간
    @Published var festivalWhere: [String] = [] // 개최장소
    @Published var festivalType: [String] = [] // 축제유형
    @Published var festivalPhoneNumber: [String] = [] // 연락처
    
    private let localFestivalRef: DatabaseReference
    
    init() {
        let festivalDatabase = Database.database().reference()
        localFestivalRef = festivalDatabase.child("지역축제정보데이터")
        
        localFestivalRef.observe(.childAdded) { [weak self] snapshot in
            guard let self = self else { return }
            
            if let festivalData = snapshot.value as? [String: Any],
               let nameFestival = festivalData["축제명"] as? String?,
               let unwrappedFestivalName = nameFestival,
               !unwrappedFestivalName.isEmpty,
               !self.festivalName.contains(unwrappedFestivalName),
               
               let addressFestival = festivalData["개최장소"] as? String?,
               let unwrappedFestivalAddress = addressFestival,
               !unwrappedFestivalAddress.isEmpty,
               
               let howFestival = festivalData["개최방식"] as? String,
               let whenFestival = festivalData["개최기간"] as? String,
               let typeFestival = festivalData["축제유형"] as? String,
               let numberFestival = festivalData["연락처"] as? String {
                self.festivalName.append(unwrappedFestivalName)
                self.festivalWhere.append(unwrappedFestivalAddress)
                self.festivalHow.append(howFestival)
                self.festivalWhen.append(whenFestival)
                self.festivalType.append(typeFestival)
                self.festivalPhoneNumber.append(numberFestival)
            }
            
        }
    }
}
