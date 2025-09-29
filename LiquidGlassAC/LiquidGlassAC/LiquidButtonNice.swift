//
//  LiquidButtonNice.swift
//  LiquidGlassAC
//
//  Created by Uri on 29/9/25.
//

import SwiftUI

struct LiquidButtonNice: View {
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStackOfCards
            }
            .navigationTitle("Liquid Glass FAB")
            .navigationBarTitleDisplayMode(.large)
            .overlay(alignment: .bottomTrailing) {
                plusButton
            }
        }
    }
}

#Preview {
    LiquidButtonNice()
}

extension LiquidButtonNice {
    
    private var LazyVStackOfCards: some View {
        LazyVStack(spacing: 16) {
            ForEach(0..<20) { index in
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [.blue.opacity(0.3), .purple.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 120)
                    .overlay {
                        Text("Card \(index + 1)")
                            .font(.headline)
                            .foregroundStyle(.primary)
                    }
                    .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
    
    private var plusButton: some View {
        // GlassEffectContainer improves performance of the elements it contains
        GlassEffectContainer {
            VStack {
                if isExpanded {
                    Button {} label: {
                        Image(systemName: "photo")
                    }
                    Button {} label: {
                        Image(systemName: "video")
                    }
                    Button {} label: {
                        Image(systemName: "link")
                    }
                }
                Button {
                    withAnimation {
                        isExpanded.toggle()
                    }
                } label: {
                    Image(systemName: isExpanded ? "xmark" : "plus")
                        .font(.title2)
                        .bold()
                        //.rotationEffect(.degrees(isExpanded ? 90 : 0))
                }
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
            .controlSize(.large)
            .padding(25)
            .glassEffectTransition(.matchedGeometry) // matchedGeometry is the default one
        }
    }
}
