//
//  CryptoFlowApp.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 9.04.2024.
//

import SwiftUI

@main
struct CryptoFlowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
