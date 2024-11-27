//
//  MissionView.swift
//  Moonshot
//
//  Created by Constantin Lisnic on 27/11/2024.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission

    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)

                Text(mission.formattedLaunchDate2)
                    .padding(.top)
                    .foregroundStyle(.white.opacity(0.5))

                VStack(alignment: .leading) {
                    RectangleView()

                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    Text(mission.description)

                    RectangleView()

                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)

                CrewView(mission: mission)

            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return MissionView(mission: missions[2])
        .preferredColorScheme(.dark)
}
