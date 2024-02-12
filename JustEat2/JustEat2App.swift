//

import SwiftUI

@main
struct JustEat2App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSettings())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
