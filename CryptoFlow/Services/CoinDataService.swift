//
//  CoinDataService.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 17.04.2024.
//

import Foundation
import Combine

class CoinDataService {
    
//    static let instance = CoinDataService()
    
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    let manager = NetworkingManager.self
    
    init() {
        getCoins()
    }
    
    private func getCoins() {

        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets") else { return }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "vs_currency", value: "usd"),
          URLQueryItem(name: "order", value: "market_cap_desc"),
          URLQueryItem(name: "per_page", value: "250"),
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "sparkline", value: "true"),
          URLQueryItem(name: "price_change_percentage", value: "24h"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        guard let componentsUrl = components.url else { return }
        var request = URLRequest(url: componentsUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "x-cg-demo-api-key": "\(ProcessInfo.processInfo.environment["API_KEY"] ?? "")"
        ]
        
        
        coinSubscription = manager.download(request: .urlRequest(request))
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: manager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
    
    
}

private class GetCoinRequest {
    
}
