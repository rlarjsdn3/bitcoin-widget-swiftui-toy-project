//
//  BitcoinWidgetExtension.swift
//  BitcoinWidgetExtension
//
//  Created by 김건우 on 3/30/24.
//

import WidgetKit
import SwiftUI

struct BitcoinWidgetExtension: Widget {
    let kind: String = "BitcoinWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            BitcoinWidgetView(entry: entry)
                .containerBackground(Color.widgetBackground, for: .widget)
        }
        .configurationDisplayName("Bitcoin")
        .description("This is an bitcoin widget.")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    BitcoinWidgetExtension()
} timeline: {
    BitcoinEntry()
    BitcoinEntry()
}
