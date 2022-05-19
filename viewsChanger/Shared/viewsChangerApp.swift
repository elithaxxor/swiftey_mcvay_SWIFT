//
//  viewsChangerApp.swift
//  Shared
//
//  Created by a-robota on 4/4/22.
//

import SwiftUI

@main
struct viewsChangerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
