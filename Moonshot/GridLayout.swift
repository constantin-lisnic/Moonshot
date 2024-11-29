//
//  GridLayout.swift
//  Moonshot
//
//  Created by Constantin Lisnic on 27/11/2024.
//

import SwiftUI

struct GridLayout: View {
    let missions: [Mission]

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        MissionThumbnail(mission: mission)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return GridLayout(missions: missions)
        .preferredColorScheme(.dark)
}
