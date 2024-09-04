//
//  CoinDetailView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/5/24.
//

import SwiftUI

struct UpbitDetailView: View {
    
    var market: Market
    
    init(market: Market) {
        self.market = market
    }
    
    var body: some View {
        Text(market.englishName)
    }
}
#Preview {
    UpbitDetailView(market: Market(market: "test", koreanName: "test", englishName: "test"))
}
