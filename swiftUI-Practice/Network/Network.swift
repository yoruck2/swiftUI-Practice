//
//  Network.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/4/24.
//

import SwiftUI

typealias Markets = [Market]

struct CoinAPI {
    
    private init() { }

    static func fetchMarketGCD(completion: @escaping (Markets) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Markets.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
//                print(error)
            }
        }.resume()
    }
    
    static func fetchMarketConcurreny() async throws -> Markets {
    
//        let url = URL(string: "https://pro-api.coinmarketcap.com/v2/cryptocurrency/info?id=1,2,3,4,5")!
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        var request = URLRequest(url: url)    
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let decodedData = try JSONDecoder().decode(Markets.self, from: data)
        return decodedData
    }
}

struct Market: Hashable, Codable, Identifiable {
    var id = UUID()
    let market, koreanName, englishName: String

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
