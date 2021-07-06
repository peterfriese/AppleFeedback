## Bottom toolbar displays incorrect content during transition when using `StackNavigationViewStyle` 

###  Prerequisites

- Xcode 13 b2 (13A5155e)
- Simulator or physical device running iOS 15 beta 1 or iOS 15 beta 2

###  Steps to reproduce
- Run the following app on the Simulator
- turn on slow animations to better observe the effect
- tap on "Navigate to view one (no toolbar)"
- Observe:
  1) Top toolbar fades out while transitioning [expected]
  2) No effect observed in bottom toolbar while transitioning [expected]
- navigate back to the menu screen
- top on "Navigate to view two (w/ toolbar)"
- Observe:
  1) Top toolbar fades out while transitioning [expected]
  2) Bottom toolbar
     - the plus icon and the text "Level TWO" appear in the toolbar of the Menu screen *before* the transition starts [unexpected]
     - the second screen transitions in [expected]
     - while the transition is in progress, the second screen doesn't have a bottom toolbar [unexpected]
     - once the transition has completed, the bottom toolbar appears on the second screen [unexpected]

### Screen recording

https://user-images.githubusercontent.com/232107/124569094-ec176d00-de45-11eb-90bb-a50cdf0fb6e8.mp4


### Expected behaviour
- top on "Navigate to view two (w/ toolbar)"
- the second screen transitions in
- the bottom toolbar is visible on the second screen _while the screen ransitions in_

### Workarounds
1) Uncomment `.navigationViewStyle(.stack)` on the NavigationView
2) Add an empty `Text("")` (or any other toolbar items) to the toolbar of the first screen
