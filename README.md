SwiftRandom
==============

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

SwiftRandom is a tiny help suite for generating random data such as 
* Random human stuff like: names, gender, titles, tags, conversations
* Random data types like: Int, CGFloat, Bool, UIColor, NSDate, NSURL, element in Array

## Installation

### Install via [Carthage](https://github.com/Carthage/Carthage)

* Create a `Cartfile` with the following specification and run `carthage update`. (It has to specify a branch name since this project does not have a tagged version yet.)

  ```
  github "thellimist/SwiftRandom" "master"
  ```

* Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add the framework to an iOS project.

### Install Manually

- Download and drop 'Randoms.swift' in your project.

## Usage

```swift
func asExtension() {
	Int.random()
	CGFloat.random()
	NSDate.random()
	NSDate.randomWithinDaysBeforeToday(7)
	UIColor.random()
}
```

```swift
func asMethods() {
	// Return random Int >= 10 and <= 20
	// Example Output: 13
	Randoms.randomInt(10,20) 

	// Return random CGFloat between 1 >= and >= 0
	// Example Output: 0.622616
	Randoms.randomCGFloat()
	
	// Return true 30%, false %70
	// Example Output: false
	Randoms.randomPercentageisOver(70)

	// Return true or false
	// Example Output: false
	Randoms.randomBool()

	// Return random NSDate today > and > today - 7. 
	// Example Output: 2015-10-08 03:55:09 +0000
	Randoms.randomDateWithinDaysBeforeToday(7)

	// Random Date since 1970
	// Example Output: 1997-02-01 15:27:08 +0000
	Randoms.randomDate()

	// Return UIColor. Alpha channel always 1.
	// Example Output: UIDeviceRGBColorSpace 0.645737 0.126625 0.52535 1
	Randoms.randomColor()

	// ==================== Fake Generators for Fake Datasources ==================== //

	// Return random English honorific
	// Example Output: "Dr."
	Randoms.randomEnglishHonorific()

	// Return random name
	// Example Output: "Megan Freeman"
	Randoms.randomFakeName()

	// Return random fake name prefixed by English honorific
	// Example Output: "Dr. Megan Freeman"
	Randoms.randomFakeNameAndEnglishHonorific()

	// Return "Male" or "Female" as String
	// Example Output: "Female"
	Randoms.randomFakeGender()

	// Return random conversation
	// Example Output: "No! I'm tired of doing what you say."
	Randoms.randomFakeConversation()

	// Return random title 
	// Example Output: "B2 Pilot @ USAF"
	Randoms.randomFakeTitle()

	// Return random tag as string 
	// Example Output: "question"
	Randoms.randomFakeTag()
}

```

###Requirements
- Swift version 2.0

###Improvement
- Feel free adding your own random data functions and sending pull requests.

#####Possible features:
- Random profile image (Should not include the image inside project, should load it from web when needed)
- Random wildlife pictures (Should not include the image inside project, should load it from web when needed)

###License
- SwiftRandom is available under the MIT license. See the [LICENSE file](https://github.com/thellimist/SwiftRandom/blob/master/LICENSE).

##Keywords
random, swift, data, generator, faker, fake, 
