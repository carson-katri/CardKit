![CardKit](https://raw.githubusercontent.com/CTKRocks/CardKit/master/Images/Banner.png)
iOS 11 cards in Swift

# Installation
Add the `CardKit.swift` file to your Xcode project.

# Usage

### Storyboard
* Add a UIView
![UIView](https://raw.githubusercontent.com/CTKRocks/CardKit/master/Images/UIView.png)
* Change it to a `CardView`
![CardView](https://raw.githubusercontent.com/CTKRocks/CardKit/master/Images/CardView.png)
* Change any settings
![Options](https://raw.githubusercontent.com/CTKRocks/CardKit/master/Images/Storyboard.png)

# Options
You can also make a blurred `CardView`, however the shadow will not be applied.
A `CardView` can also detect a tap:
```swift
// Set to .none for no blur
card.blur = .light
card.tapped = {
  self.dismiss(animated: true, completion: nil)
}
```
