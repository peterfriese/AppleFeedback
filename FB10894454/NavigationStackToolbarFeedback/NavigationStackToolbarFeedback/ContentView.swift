//
//  ContentView.swift
//  NavigationStackToolbarFeedback
//
//  Created by Peter Friese on 27.07.22.

import SwiftUI

struct ContentView: View {
  let colors: [Color] = [.mint, .pink, .teal]
  @State private var selection: Color? // Nothing selected by default.
  
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("Mint", value: Color.mint)
        NavigationLink("Pink", value: Color.pink)
        NavigationLink("Teal", value: Color.teal)
      }
      .navigationDestination(for: Color.self) { color in
        ColorDetail(color: color)
      }
      .navigationTitle("Colors")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {}) {
            Image(systemName: "gear")
          }
        }
        ToolbarItemGroup(placement: .bottomBar) {
          Spacer()
          Button(action: {}) {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
}

struct ColorDetail: View {
  var color: Color
  
  var body: some View {
    color.navigationTitle(color.description)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

