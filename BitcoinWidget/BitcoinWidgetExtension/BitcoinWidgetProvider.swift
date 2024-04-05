//
//  BitcoinWidgetProvider.swift
//  BitcoinWidget
//
//  Created by 김건우 on 3/31/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> BitcoinEntry {
        BitcoinEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (BitcoinEntry) -> ()) {
        let entry = BitcoinEntry()
        completion(entry)
    }

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
            print("== nil")
            return nil
        }
        print(bitcoinEntry)
        return bitcoinEntry
    }
    
    private func decode<T: Decodable>(of type: T.Type, with data: Data) -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: data)
    }
}
