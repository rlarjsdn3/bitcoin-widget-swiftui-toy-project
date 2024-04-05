//
//  BitcoinWidgetView.swift
//  BitcoinWidget
//
//  Created by 김건우 on 3/31/24.
//

import Charts
import SwiftUI

struct BitcoinWidgetView : View {
    
    // MARK: - Properties
    var entry: Provider.Entry

    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Image(.bitcoin)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text("Bitcoin")
                        .foregroundStyle(.white)
                    
                    Text("BTC")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Text(entry.currentPrice.toCurrency)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .top, spacing: 15) {
                VStack(spacing: 3) {
                    Text("This Week")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    Text(entry.priceChangePercentage24h.toPercentage)
                        .fontWeight(.semibold)
                        .foregroundStyle(entry.priceChangePercentage24h > 0 ? .red : .green)
                }
                
                Chart(entry.sparkline.price.indices, id: \.self) { index in
                    let lineColor = entry.priceChangePercentage24h > 0 ? Color.red : Color.green
                    
                    LineMark(
                        x: .value("index", index),
                        y: .value("price", entry.sparkline.price[index] - getMinimumPrice())
                    )
                    .foregroundStyle(lineColor)
                    
                    AreaMark(
                        x: .value("index", index),
                        y: .value("price", entry.sparkline.price[index] - getMinimumPrice())
                    )
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                lineColor.opacity(0.2),
                                lineColor.opacity(0.1),
                                Color.clear
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    
                }
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
            }
        }
    }
    
    // MARK: - Helpers
    private func getMinimumPrice() -> Double {
        guard let min = entry.sparkline.price.min() else {
            return .zero
        }
        return min
    }
    
}
