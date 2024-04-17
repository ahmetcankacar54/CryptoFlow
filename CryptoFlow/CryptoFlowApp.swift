//
//  CryptoFlowApp.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 9.04.2024.
//

import SwiftUI

@main
struct CryptoFlowApp: App {
    
    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(vm)
        }
    }
}
