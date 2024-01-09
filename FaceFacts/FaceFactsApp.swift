//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Alexander Völz on 09.01.24.
//

import SwiftUI
import SwiftData

@main
struct FaceFactsApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
