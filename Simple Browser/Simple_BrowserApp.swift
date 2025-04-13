//
//  Simple_BrowserApp.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import SwiftUI
import SwiftData

@main
struct Simple_BrowserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:[Website.self])
        }
    }
}
