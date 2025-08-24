import SwiftUI

struct ContentView: View {
  var title: String
  var body: some View {
    List {
      NavigationLink(value: "Swift") {
        Text("Hello, Swift!")
      }
      NavigationLink(value: "Objective-C") {
        Text("Hello, Objective-C!")
      }
      NavigationLink(value: "JavaScript") {
        Text("Hello, JavaScript!")
      }
      NavigationLink(value: "Lisp") {
        Text("Hello, Lisp!")
      }
      NavigationLink(value: "Java") {
        Text("Hello, Java!")
      }
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
      Text("Filler")
    }
    //    .navigationTitle(title)
    //    .navigationSubtitle(
    //        Text("Hello, World!")
    //    )
    .navigationBarTitleDisplayMode(.large)
    .navigationDestination(for: String.self) { value in
      ContentView(title: value)
    }
    .toolbar {
      ToolbarItem(placement: .largeTitle) {
        HStack {
          Text(title)
            .font(.largeTitle.bold())
            .foregroundStyle(.red)
          Spacer()
        }
      }
      ToolbarItem(placement: .largeSubtitle) {
        HStack {
          Text("Subtitle: \(title)")
            .foregroundStyle(.red)
          Spacer()
        }
      }
      ToolbarItem(placement: .subtitle) {
        VStack {
          HStack {
            Text(title)
              .font(.headline.bold())
              .foregroundStyle(.blue)
            Spacer()
          }
          HStack {
            Text("Subtitle: \(title)")
              .foregroundStyle(.blue)
            Spacer()
          }
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    ContentView(title: "World")
  }
}
