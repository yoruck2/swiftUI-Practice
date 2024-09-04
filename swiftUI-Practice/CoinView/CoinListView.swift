//
//  CoinListView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/3/24.
//

import SwiftUI

struct CoinListView: View {
    
    @State private var searchText = ""
    @State var markets: [Market] = []
    
    var filteredMarkets: [Market] {
        return searchText.isEmpty ? markets : markets.filter { $0.englishName.contains(searchText) }
    }
    
    var body: some View {
        
        NavigationView {
//                Color(.black)
//                    .ignoresSafeArea()
//                    .navigationTitle("Search")
//                    .navigationBarTitleTextColor(.white)
//                    .searchable(text: $text)

            ScrollView {
                listView()
                    .navigationTitle("Search")
            }
            .searchable(text: $text)
            .refreshable {
                do {
                    market = try await CoinAPI.fetchMarketConcurreny()
                    print(market)
                } catch {
                 
                }
            }
            .task {
                
                // MARK: GCD
//                UpbitAPI.fetchMarketGCD { data in
//                    market = data
//                }
                
                // MARK: Concurrency
                do {
                    market = try await CoinAPI.fetchMarketConcurreny()
                } catch {
                 
                }
            }
        }
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach(filteredMarkets, id: \.id){ market in
                NavigationLink {
                    UpbitDetailView(market: market)
                } label: {
                    rowView(market)
                }
            }
        }
    }
    func rowView(_ item: Market) -> some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text(item.koreanName)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                Text(item.englishName)
                    .foregroundStyle(.gray)
            })
            Spacer()
            Text(item.market)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
}
extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}
#Preview {
    CoinListView()
}


