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
        return searchText.isEmpty ? markets : markets.filter { $0.englishName.lowercased().contains(searchText.lowercased()) || $0.koreanName.contains(searchText) }
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
            .searchable(text: $searchText)
            .refreshable {
                await fetchMarkets()
            }
            .task {
                await fetchMarkets()
            }
        }
    }
    
    func fetchMarkets() async {
        do {
            markets = try await CoinAPI.fetchMarketConcurreny()
        } catch {
            print(error)
        }
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach(filteredMarkets, id: \.id) { market in
                NavigationLink {
                    UpbitDetailView(market: market)
                } label: {
                    rowView(market)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    func rowView(_ item: Market) -> some View {
        HStack {
            Image(systemName: "bitcoinsign.circle")
                .frame(width: 30, height: 30)
            VStack(alignment: .leading, content: {
                Text(item.koreanName)
                    .fontWeight(.heavy)
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

//extension View {
//    @available(iOS 14, *)
//    func navigationBarTitleTextColor(_ color: Color) -> some View {
//        let uiColor = UIColor(color)
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
//        return self
//    }
//}

#Preview {
    CoinListView()
}


