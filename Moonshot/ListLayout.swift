//
//  ListLayout.swift
//  Moonshot
//
//  Created by Constantin Lisnic on 27/11/2024.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]

    var body: some View {
        List {
            ForEach(missions) { mission in
                MissionThumbnail(mission: mission)
                    .overlay {
                        NavigationLink {
                            MissionView(mission: mission)
                        } label: {
                            EmptyView()
                        }
                        .opacity(0)
                    }
                    .listRowBackground(Color.darkBackground)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return ListLayout(missions: missions)
        .preferredColorScheme(.dark)
}
