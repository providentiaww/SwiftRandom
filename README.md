SwiftRandom
==============

SwiftRandom is a tiny help suite for generating random data such as:

* Random human stuff like: names, gender, titles, tags, conversations
* Random data types like: Int, CGFloat, Bool, Date, URL, element in Array

Note the original client side Swift 2 repo can be found here:
[https://github.com/thellimist/SwiftRandom](https://github.com/thellimist/SwiftRandom)

## This Fork

This fork is intended as a server side utility. 

* It is Swift 3.0 and Swift Package Manager (SPM) ready.
* Significant test coverage has also been added.

## Usage

```swift
func asExtension() {
	Int.random(2, 77) // Random between 2-77
	Int.random(2...77)
	Int32.random(13, 37) // Random between 13-37
	Int32.random(13...37)
	Double.random()
	Float.random(3.2, 4.5) // Random between 3.2-4.5
	CGFloat.random()
	Date.random()
	Date.randomWithinDaysBeforeToday(7)
	URL.random()
	
	// Array Extensions
	var someArray = ["hello", "world"]
	someArray[0..<someArray.count].randomItem() // Array slice
	someArray.randomItem()
}
```

```swift
func asMethods() {
	// Return random Int >= 10 and <= 20
	// Example Output: 13
	Randoms.randomInt(10,20)
	
	// Return random Int32 >= 10 and <= 20
	// Example Output: 13
	Randoms.randomInt32(10,20)
	
	// Return random Double >= 10 and <= 20
	// Example Output: 11.511219042938
	Randoms.randomDouble(10,20)

	// Return random Float >= 10 and <= 20
	// Example Output: 17.0361
	Randoms.randomFloat(10,20)

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

	// Return random URL
	// Example Output: http://leagueoflegends.com/
	Randoms.randomURL()

	// ==================== Fake Generators for Fake Datasources ==================== //

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
	
	// Return random currency as String
	// Example Output: "EUR"
	Randoms.randomCurrency()
	
}

```

###Requirements

- Swift version 3.0


## Installation

### Install via Swift Package Manager

* Add the following to your `Package.swift` file:

``` swift
.Package(
    url: "https://github.com/iamjono/SwiftRandom.git", 
    majorVersion: 1, minor: 0
    ),
```

Then, regenerate your Xcode project:

```
swift package generate-xcodeproj
```

### Install Manually

- Download and drop 'Randoms.swift' in your project.


###License
- SwiftRandom is available under the MIT license. See the [LICENSE file](https://github.com/thellimist/SwiftRandom/blob/master/LICENSE).

##Keywords
random, swift, data, generator, faker, fake
