//
//  FetchingView.swift
//  Art Generator
//
//  Created by Omer Cagri Sayir on 27.01.2024.
//

import SwiftUI

struct FetchingView: View {
    @State private var rotation = 0.0
    var body: some View {
        ZStack {
            Image("artist")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            Text("🌟")
                .font(.system(size: 70))
                .offset(x: -150)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear.speed(0.2).repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear {
            rotation = 360
        }
    }
}

#Preview {
    FetchingView()
}
