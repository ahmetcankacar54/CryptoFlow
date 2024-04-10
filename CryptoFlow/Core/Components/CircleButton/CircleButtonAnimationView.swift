//
//  CircleButtonAnimationView.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 11.04.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        VStack {

            Circle()
                .stroke(lineWidth: 5.0)
                .scale(animate ? 1.0 : 0.0)
                .opacity(animate ? 0.0 : 1.0)
                .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
                
        }
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
    }
}
