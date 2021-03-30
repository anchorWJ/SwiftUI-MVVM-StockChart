//
//  USStockNewsApp.swift
//  Shared
//
//  Created by w simple on 2021/03/30.
//

import SwiftUI

@main
struct USStockNewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
