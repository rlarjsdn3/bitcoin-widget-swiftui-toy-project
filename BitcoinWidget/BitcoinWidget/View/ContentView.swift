//
//  ContentView.swift
//  BitcoinWidget
//
//  Created by 김건우 on 3/30/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        Button("Reload Widget Timeline") {
            // ⭐️ 앱 내 모든 위젯의 타임라인을 리로드함
            WidgetCenter.shared.reloadAllTimelines()
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
