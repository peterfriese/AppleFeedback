//
//  ContentView.swift
//  TextFieldBinding
//
//  Created by Peter Friese on 30.12.21.
//

import SwiftUI
import Combine

extension Binding {
  
  /// When the `Binding`'s `wrappedValue` changes, the given closure is executed.
  /// - Parameter closure: Chunk of code to execute whenever the value changes.
  /// - Returns: New `Binding`.
  func onUpdate(_ closure: @escaping (Value) -> Void) -> Binding<Value> {
    Binding(get: {
      wrappedValue
    }, set: { newValue in
      wrappedValue = newValue
      closure(newValue)
    })
  }
}

class ViewModel: ObservableObject {
  @Published var secondText = ""
  
  var cancellable: AnyCancellable?
  
  init() {
    cancellable = $secondText.sink { value in
      print("Pipeline received value: [\(value)]")
    }
  }
}

struct ContentView: View {
  @State var firstText: String = ""
  @StateObject var viewModel = ViewModel()
  
  var body: some View {
    Form {
      TextField("First text", text: $firstText.onUpdate { print("Binding for first text updating. New value: [\($0)]")})
        .onChange(of: firstText) { newValue in
          print("onChange: New value for firstText: [\(newValue)]")
        }
      
      TextField("Second text", text: $viewModel.secondText.onUpdate { print("Binding for second text  updating. New value: [\($0)]")})
        .onChange(of: viewModel.secondText) { newValue in
          print("onChange: New value for secondText: [\(newValue)]")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
