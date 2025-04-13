//
//  ContentView.swift
//  mono
//
//  Created by Cameron Zollinger on 1/18/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedTab = 0

    var body: some View {
            TabView(selection: $selectedTab) {
                LibraryView()
                    .tabItem {
                        Image(
                            systemName: selectedTab == 0
                            ? "rectangle.stack.fill" : "rectangle.stack"
                        )
                        .environment(\.symbolVariants, .none)
                    }
                    .tag(0)
                
                ExploreView()
                    .tabItem {
                        Image(
                            systemName: selectedTab == 1
                            ? "rectangle.grid.2x2.fill" : "rectangle.grid.2x2"
                        )
                        .environment(\.symbolVariants, .none)
                    }
                    .tag(1)
                
                ProfileView()
                    .tabItem {
                        Image(
                            systemName: selectedTab == 2 ? "person.fill" : "person"
                        )
                        .environment(\.symbolVariants, .none)
                    }
                    .tag(2)
            }
            .tint(Colors(colorScheme: colorScheme).grey900)
            .font(.custom("Menlo-Regular", size: 12))
    }
}

#Preview {
    ContentView()
}
