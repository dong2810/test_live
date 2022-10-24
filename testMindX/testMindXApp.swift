//
//  testMindXApp.swift
//  testMindX
//
//  Created by VinhLN on 13/10/2022.
//

import SwiftUI

@main
struct testMindXApp: App {
    let migrator = Migrator()

    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
