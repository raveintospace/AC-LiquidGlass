//
//  LiquidTabBar.swift
//  LiquidGlassAC
//
//  Created by Uri on 29/9/25.
//

import SwiftUI

struct LiquidTabBar: View {
    
    // Reads placement of tabViewBottomAccessory (.inline, .expanded...)
    @Environment(\.tabViewBottomAccessoryPlacement) var placement
    
    @State private var search = ""
    
    var body: some View {
        TabView {
            Tab("Library", systemImage: "books.vertical") {
                ScrollView {
                    libraryContent
                }
            }
            Tab("Documents", systemImage: "document") {
                Text("Document")
            }
            Tab(role: .search) {
                NavigationStack {
                    Text("Search")
                }
            }
        }
        .searchable(text: $search, prompt: "Enter any search")
        .tabBarMinimizeBehavior(.onScrollDown)
        .tabViewBottomAccessory {
            HStack {
                VStack(alignment: .leading) {
                    Text("Uri46")
                        .font(.caption)
                    Text("Tab View Bottom Accessory")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button {} label: {
                    Image(systemName: "play")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LiquidTabBar()
}

extension LiquidTabBar {
    
    private var libraryContent: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(1..<50) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(width: 100, height: 100)
            }
        }
    }
}
