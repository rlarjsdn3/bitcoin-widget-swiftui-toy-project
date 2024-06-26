//
//  Double+Ext.swift
//  BitcoinWidget
//
//  Created by 김건우 on 4/5/24.
//

import Foundation

extension Double {
    
    var toCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let string = formatter.string(from: self as NSNumber) ?? "0"
        return "$" + string
    }
    
    var toPercentage: String {
        String(format: "%.2f", self) + "%"
    }
    
}
