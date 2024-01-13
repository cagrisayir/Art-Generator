//
//  Art_GeneratorApp.swift
//  Art Generator
//
//  Created by Omer Cagri Sayir on 13.01.2024.
//

import SwiftUI

@main
struct AppEntry: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(Bundle.main.infoDictionary?["API_KEY"] as? String)
                }
        }
    }
}
