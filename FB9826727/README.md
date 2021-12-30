## `Textfield` updates bindings twice

###  Prerequisites

- Version 13.2.1 (13C100)
- Simulators or physical devices running iOS 14.5 and iOS 15.x

###  Steps to reproduce
- Run the following app on the Simulator
- Type a single character into each of the two input fields
- Observe:
	- iOS 14.5 output

			Pipeline received value: []
			Binding for first text updating. New value: [A]
			onChange: New value for firstText: [A]
			Pipeline received value: [B]
			Binding for second text  updating. New value: [B]
			onChange: New value for secondText: [B]
			
	- iOS 15.x output

			Pipeline received value: []
			Binding for first text updating. New value: [A]
			Binding for first text updating. New value: [A]
			onChange: New value for firstText: [A]
			Pipeline received value: [B]
			Binding for second text  updating. New value: [B]
			Pipeline received value: [B]
			Binding for second text  updating. New value: [B]
			onChange: New value for secondText: [B]
	- As you can see, the binding is updated twice per keystroke on iOS 15.x, but only once on iOS 14.5
			

### Expected behaviour
- The binding should be updated once per keystroke (just like on iOS 14.5)