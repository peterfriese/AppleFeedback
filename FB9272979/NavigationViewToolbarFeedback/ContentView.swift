//
//  ContentView.swift
//  NavigationViewToolbarFeedback
//
//  Created by Peter Friese on 06.07.21.
//

import SwiftUI

// Description: Bottom toolbar displays incorrect content during transition when using `StackNavigationViewStyle`
// when navigating from a screen that has no items in the bottom toolbar to a screen that has items in the bottom toolbar
//
// Prerequisites
// - Xcode 13 b2 (13A5155e)
// - Simulator or physical device running iOS 15 beta 1 or iOS 15 beta 2
//
// Steps to reproduce
// - Run the following app on the Simulator
// - turn on slow animations to better observe the effect
//
// - tap on "Navigate to view one (no toolbar)"
// - Observe:
//   1) Top toolbar fades out while transitioning [expected]
//   2) No effect observed in bottom toolbar while transitioning [expected]
//
// - navigate back to the menu screen
// - top on "Navigate to view two (w/ toolbar)"
// - Observe:
//   1) Top toolbar fades out while transitioning [expected]
//   2) Bottom toolbar
//      - the plus icon and the text "Level TWO" appear in the toolbar of the Menu screen *before* the transition starts [unexpected]
//      - the second screen transitions in [expected]
//      - while the transition is in progress, the second screen doesn't have a bottom toolbar [unexpected]
//      - once the transition has completed, the bottom toolbar appears on the second screen [unexpected]
// - Expected behaviour
//   - top on "Navigate to view two (w/ toolbar)"
//   - the second screen transitions in
//   - the bottom toolbar is visible on the second screen _while the screen ransitions in_
// - Workarounds
//   1) Uncomment `.navigationViewStyle(.stack)` on the NavigationView
//   2) Add an empty `Text("")` (or any other toolbar items) to the toolbar of the first screen

struct ContentView: View {
  var body: some View {
    NavigationView {
      MenuView()
    }
    // fix 1: comment the following line
    .navigationViewStyle(.stack)
  }
}

struct MenuView: View {
  var body: some View {
    List {
      NavigationLink(destination: LevelOneView()) {
        Text("Navigate to view one (no toolbar)")
      }
      NavigationLink(destination: LevelTwoView()) {
        Text("Navigate to view two (w/ toolbar)")
      }
    }
    .navigationTitle("Menu")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: {}) {
          Image(systemName: "gear")
        }
      }
      // fix 2: uncomment the following lines to add an empty Text into the bottom toolbar
//      ToolbarItem(placement: .bottomBar) {
//        Text("")
//      }
    }
  }
}

struct LevelOneView: View {
  
  var items = ["a", "b", "c", "d", "e", "f", "g"]
  
  var body: some View {
    List {
      ForEach(items, id:\.self) { item in
        NavigationLink(destination: LevelTwoView()) {
          Text(item)
        }
      }
    }
    .navigationTitle("Level One")
  }
}

struct LevelTwoView: View {
  var items = [
    "one", "two", "three", "four", "five", "six", "seven"
  ]
  
  var body: some View {
    List {
      ForEach(items, id:\.self) { item in
        Text(item)
      }
    }
    .navigationTitle("Level Two")
    .toolbar {
      ToolbarItem(placement: .status) {
        Button(action: {}) {
          Text("Level TWO")
            .font(.caption)
        }
      }
      ToolbarItem(placement: .bottomBar) {
        Button(action: {}) {
          Image(systemName: "plus")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
