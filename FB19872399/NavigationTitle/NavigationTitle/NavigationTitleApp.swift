import SwiftUI

@main
struct NavigationTitleApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        ContentView(title: "World")
      }
    }
  }
}
