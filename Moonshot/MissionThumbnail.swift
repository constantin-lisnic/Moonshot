//
//  MissionThumbnail.swift
//  Moonshot
//
//  Created by Constantin Lisnic on 27/11/2024.
//

import SwiftUI

struct MissionThumbnail: View {
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return MissionThumbnail(mission: missions[1])
        .preferredColorScheme(.dark)
}
