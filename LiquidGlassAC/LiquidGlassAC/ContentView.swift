//
//  ContentView.swift
//  LiquidGlassAC
//  https://www.youtube.com/live/Bt16wzsDn-0?si=Z853ECoIfBHIVk8p
//  Created by Uri on 29/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue.gradient)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .padding()
                    .glassEffect(.clear.interactive(), in: .circle)
                
                Text("Glass Effect!")
                    .padding()
                    .glassEffect(.clear.tint(.green))
                
                Text("Glass Effect!")
                    .padding()
                    .glassEffect(.clear.tint(.orange).interactive())
                
                Text("Glass Effect!")
                    .padding()
                    .glassEffect(.clear.tint(.blue).interactive(), in: .rect(cornerRadius: 10))
                
                Button("Button") {
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.red)
                .tint(.white)
                
                Button("Glass Button") {
                }
                .buttonStyle(.glass)
                .foregroundStyle(.orange)
                .tint(.white)
                
                Button("Prominent Glass Button") {
                }
                .buttonStyle(.glassProminent)
                .foregroundStyle(.white)
                .tint(.orange)
                
                Text("Avoid interactive to improve performance")
                    .bold()
                    .underline()
                    .foregroundStyle(.yellow)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
