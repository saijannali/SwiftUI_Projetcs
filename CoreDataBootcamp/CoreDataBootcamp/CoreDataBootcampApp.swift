//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Sai Jannali on 7/4/23.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
