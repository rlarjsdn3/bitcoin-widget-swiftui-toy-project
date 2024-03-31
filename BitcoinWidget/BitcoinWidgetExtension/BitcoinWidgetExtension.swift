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
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    BitcoinWidgetExtension()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
