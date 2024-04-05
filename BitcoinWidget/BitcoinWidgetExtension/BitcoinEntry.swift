//
//  BitcoinEntry.swift
//  BitcoinWidget
//
//  Created by 김건우 on 3/31/24.
//

import WidgetKit

struct BitcoinEntry: TimelineEntry, Decodable {
    var date: Date = Date()
    let currentPrice: Double
    let priceChangePercentage24h: Double
    let sparkline: SparkLine
    
    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case sparkline = "sparkline_in_7d"
    }
    
    init() {
        self.date = Date()
        self.currentPrice = 0.0
        self.priceChangePercentage24h = 0.0
        self.sparkline = SparkLine()
    }
}

struct SparkLine: Decodable {
    let price: [Double]
    
    enum CodingKeys: String, CodingKey {
        case price
    }
    
    init() {
        self.price = []
    }
}
