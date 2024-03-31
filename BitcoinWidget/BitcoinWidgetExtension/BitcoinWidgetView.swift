//
//  BitcoinWidgetView.swift
//  BitcoinWidget
//
//  Created by 김건우 on 3/31/24.
//

import SwiftUI

struct BitcoinWidgetView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}
