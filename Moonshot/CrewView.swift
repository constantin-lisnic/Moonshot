//
//  CrewView.swift
//  Moonshot
//
//  Created by Constantin Lisnic on 27/11/2024.
//

import SwiftUI

struct CrewView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission

    var crew: [CrewMember] {
        mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Could not find astronaut \(member.name)")
            }
        }
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(
                                            .white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)

                                Text(crewMember.role)
                                    .foregroundStyle(
                                        .white.opacity(0.5))
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return CrewView(mission: missions[2])
        .preferredColorScheme(.dark)
}
