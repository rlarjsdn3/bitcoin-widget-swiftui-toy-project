//
//  BitcoinWidgetProvider.swift
//  BitcoinWidget
//
//  Created by 김건우 on 3/31/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    // ⭐️ 데이터를 불러오기 전에 보여줄 Placeholder
    func placeholder(in context: Context) -> BitcoinEntry {
        BitcoinEntry()
    }

    // ⭐️ 위젯 갤러리에서 위젯을 고를 때 보이는 샘플 위젯을 보여주는 메서드
    // context.isPreview가 true인 경우 위젯 갤러리에 위젯이 표출되는 상태
    func getSnapshot(in context: Context, completion: @escaping (BitcoinEntry) -> ()) {
        let entry = BitcoinEntry()
        completion(entry)
    }

    // ⭐️ 위젯을 언제 업데이트를 시킬지 정하는 메서드
    func getTimeline(in context: Context, completion: @escaping (Timeline<BitcoinEntry>) -> ()) {
        let currentDate = Date()
        
        Task(priority: .background) {
            if var entry = try? await fetchBitcoinData() {
                entry.date = currentDate
                let next = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
                let timeline = Timeline(entries: [entry], policy: .after(next))
                completion(timeline)
            }
        }
    }
}

extension Provider {
    private func fetchBitcoinData() async throws -> BitcoinEntry? {
        let url = URL(string: API.bitcoin)!
        // 네트워크 통신하기
        let (data, _) = try await URLSession.shared.data(from: url)
        // 통신한 결과를 JSON 파싱하기
        guard let entrys = self.decode(of: [BitcoinEntry].self, with: data),
              let bitcoinEntry = entrys.first else {
            return nil
        }
        return bitcoinEntry
    }
    
    private func decode<T: Decodable>(of type: T.Type, with data: Data) -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: data)
    }
}
