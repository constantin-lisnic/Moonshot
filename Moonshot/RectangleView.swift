//
//  RectangleView.swift
//  Moonshot
//
//  Created by Constantin Lisnic on 27/11/2024.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .padding(.vertical)
            .foregroundStyle(.lightBackground)
    }
}

#Preview {
    RectangleView()
}
