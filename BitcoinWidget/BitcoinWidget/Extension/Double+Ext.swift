//
//  Double+Ext.swift
//  BitcoinWidget
//
//  Created by 김건우 on 4/5/24.
//

import Foundation

extension Double {
    
    var toCurrency: String {
        "$" + String(format: "%.2f", self)
    }
    
    var toPercentage: String {
        String(format: "%.2f", self) + "%"
    }
    
}
