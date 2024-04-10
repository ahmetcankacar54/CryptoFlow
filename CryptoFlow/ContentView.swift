//
//  ContentView.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 9.04.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                Text("Accent Color")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Red Color")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.red)
                
                Text("Green Color")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.green)
            }
        }
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
