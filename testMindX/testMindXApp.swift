//
//  testMindXApp.swift
//  testMindX
//
//  Created by VinhLN on 13/10/2022.
//

import SwiftUI

@main
struct testMindXApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
