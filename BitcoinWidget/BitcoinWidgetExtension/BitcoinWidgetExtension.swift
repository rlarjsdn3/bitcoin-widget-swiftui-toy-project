//
//  BitcoinWidgetExtension.swift
//  BitcoinWidgetExtension
//
//  Created by 김건우 on 3/30/24.
//

import WidgetKit
import SwiftUI

struct BitcoinWidgetExtension: Widget {
    // ⭐️ 위젯 고유 식별자
    let kind: String = "BitcoinWidget"

    var body: some WidgetConfiguration {
        // ⭐️ 사용자가 편집할 수 없는 정적인 위젯 
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            BitcoinWidgetView(entry: entry)
                .containerBackground(Color.widgetBackground, for: .widget)
        }
        // ⭐️ 위젯 제목
        .configurationDisplayName("Bitcoin")
        // ⭐️ 위젯 설명
        .description("This is an bitcoin widget.")
        // ⭐️ 지원하는 위젯 크기 (잠금화면 위젯도 설정 가능)
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    BitcoinWidgetExtension()
} timeline: {
    BitcoinEntry()
    BitcoinEntry()
}
