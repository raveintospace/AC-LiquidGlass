//
//  SystemGlassControls.swift
//  LiquidGlassAC
//
//  Created by Uri on 29/9/25.
//

import SwiftUI

struct SystemGlassControls: View {
    
    @State private var sliderValue: Double = 0.0
    @State private var isOn: Bool = false
    @State private var segmented: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundRectangle
                
                ScrollView {
                    VStack() {
                        HStack {
                            Text("Volume")
                            Spacer()
                            Text("\(Int(sliderValue))%")
                                .padding(.horizontal)
                                .glassEffect()
                        }
                        
                        Slider(value: $sliderValue, in: 1...100)
                        
                        Toggle(isOn: $isOn) {
                            Text("Active")
                        }
                        .padding(.top)
                        
                        Picker("Theme", selection: $segmented) {
                            Text("Clear").tag(0)
                            Text("Dark").tag(1)
                            Text("Cristal").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .padding(.top)
                    }
                    .padding()
                    .glassEffect(.clear, in: .rect(cornerRadius: 10))
                }
            }
            .safeAreaPadding()
            .navigationTitle("Elements")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SystemGlassControls()
}

extension SystemGlassControls {
    
    private var backgroundRectangle: some View {
        Rectangle()
            .fill(
                LinearGradient(colors: [
                    Color.purple.opacity(0.3),
                    Color.pink.opacity(0.3),
                    Color.orange.opacity(0.1)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .ignoresSafeArea()
    }
}
