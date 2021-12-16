//
//  newcrossdjApp.swift
//  Shared
//
//  Created by Emanuele Giunta on 08/12/21.
//

import SwiftUI
import CoreData

@main
struct newcrossdjApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

