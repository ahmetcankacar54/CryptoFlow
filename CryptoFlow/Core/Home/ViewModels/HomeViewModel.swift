//
//  HomeViewModel.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 17.04.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    private let coinDataService = CoinDataService()
    
    init() {

        addSubscribers()

    }
    
    func addSubscribers() {
        coinDataService.$allCoins
            .sink { [weak self] returnedCoinModels in
                self?.allCoins = returnedCoinModels
            }
            .store(in: &cancellables)
    }

}
