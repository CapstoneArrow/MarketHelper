//
//  FirebaseModel.swift
//  Markets
//
//  Created by Andy on 5/16/24.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class MarketNames: ObservableObject {
    @Published var marketNames: [String] = []
    private let tradMarketRef: DatabaseReference
    
    init() {
        let database = Database.database().reference()
        tradMarketRef = database.child("전통시장데이터")
        
        // 하위 노드 추가 이벤트 감지
        tradMarketRef.observe(.childAdded) { [weak self] snapshot in
            guard let self = self else { return }
            
            if let marketData = snapshot.value as? [String: Any],
               let marketName = marketData["시장명"] as? String?,
               let unwrappedMarketName = marketName, // Optional 언래핑
               !unwrappedMarketName.isEmpty, // 빈 값 필터링
               !self.marketNames.contains(unwrappedMarketName) {
                self.marketNames.append(unwrappedMarketName)
            }
        }
    }
}
