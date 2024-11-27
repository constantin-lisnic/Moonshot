//
//  ContentView.swift
//  Moonshot
//
//  Created by Constantin Lisnic on 26/11/2024.
//

import SwiftUI

struct ContentView: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showingGrid = false

    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(missions: missions)
                } else {
                    ListLayout(missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            .toolbar {
                Button("Toggle Layout") {
                    showingGrid.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
