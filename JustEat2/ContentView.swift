//
//  ContentView.swift

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
           
                if settings.loggedIn || UserDefaults.standard.bool(forKey: "loggedIn"){
                    TabBar(login: $settings.loggedIn).onAppear() {
                        for user in users {
                            if user.email == UserDefaults.standard.value(forKey: "email") as? String     {
                                settings.SetUser(user: user)
                            }
                        }
                    }
                }
                    
            
                else {
                    GetStartedView()
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
