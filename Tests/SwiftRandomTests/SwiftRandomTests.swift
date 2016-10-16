import XCTest
#if os(Linux)
    import SwiftGlibc
#else
    import Darwin
#endif
@testable import SwiftRandom
class SwiftRandomTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }




	// Bool
	func testBool() {
		let test = Bool.random()
		XCTAssert(test == true || test == false)
	}
	func testBoolStruct() {
		let test = Randoms.randomBool()
		XCTAssert(test == true || test == false)
	}

	// Int
	func testIntRange() {
		let test = Int.random(range: 4..<10)
		//print("testIntRange: \(test)")
		XCTAssert(test >= 4 && test <= 10)
	}
	func testIntRangeLower() {
		let test = Int.random(lower: 0, 4)
		//print("testIntRangeLower: \(test)")
		XCTAssert(test >= 0 && test <= 4)
	}
	func testIntRangeStruct() {
		let test = Randoms.randomInt(range: 5..<10)
		//print("testIntRangeStruct: \(test)")
		XCTAssert(test >= 5 && test <= 10)
	}
	func testIntRangeLowerStruct() {
		let test = Randoms.randomInt(lower: 1, 4)
		//print("testIntRangeLowerStruct: \(test)")
		XCTAssert(test >= 1 && test <= 4)
	}


	// Int32
	func testInt32Range() {
		let test = Int32.random(range: 5..<10)
		XCTAssert(test >= 5 && test <= 10)
	}
	func testInt32RangeLower() {
		let test = Int32.random(lower: 0, 4)
		//print(test)
		XCTAssert(test >= 0 && test <= 4)
	}
	func testInt32RangeStruct() {
		let test = Randoms.randomInt32(range: 5..<10)
		//print(test)
		XCTAssert(test >= 5 && test <= 10)
	}
	func testInt32RangeLowerStruct() {
		let test = Randoms.randomInt32(lower: 0, 4)
		//print(test)
		XCTAssert(test >= 0 && test <= 4)
	}

	// randomPercentageisOver
	func testRandomPercentageisOverStruct() {
		let test = Randoms.randomPercentageisOver(percentage: 0)
		//print("testRandomPercentageisOverStruct: \(test)")
		XCTAssert(test == true)
	}


	// Double
	func testDoubleRangeLower() {
		let test = Double.random(lower: 0.01, 4.02)
//		print("testDoubleRangeLower: \(test)")
		XCTAssert(test >= 0.01 && test <= 4.02)
	}

	func testDoubleRangeLowerStruct() {
		let test = Randoms.randomDouble(lower: 0.01, 4.02)
//		print("testDoubleRangeLowerStruct: \(test)")
		XCTAssert(test >= 0.01 && test <= 4.02)
	}

	// Float
	func testFloatRangeLower() {
		let test = Float.random(lower: 0.01, 4.02)
//		print("testFloatRangeLower: \(test)")
		XCTAssert(test >= 0.01 && test <= 4.02)
	}
	func testFloatRangeLowerStruct() {
		let test = Randoms.randomFloat(lower: 0.01, 4.02)
//		print("testFloatRangeLowerStruct: \(test)")
		XCTAssert(test >= 0.01 && test <= 4.02)
	}



	#if !os(Linux)
	// something screwey with Date on foundation in linux
	// Date
	func testDate() {
		let test = Date.random()
		XCTAssert(test.timeIntervalSinceNow != 0)
	}
	func testDateWithinDaysBeforeToday() {
		let test = Date.randomWithinDaysBeforeToday(days: 2)
//		print("randomWithinDaysBeforeToday \(test)")
//		print("randomWithinDaysBeforeToday \(test.timeIntervalSinceNow)")
		XCTAssert(test.timeIntervalSinceNow <= 86400) // 86400 is num seconds in a day
	}

	func testDateStruct() {
		let test = Randoms.randomDate()
		XCTAssert(test.timeIntervalSinceNow != 0)
	}
	func testDateWithinDaysBeforeTodayStruct() {
		let test = Randoms.randomDateWithinDaysBeforeToday(days: 2)
//		print("randomWithinDaysBeforeToday \(test)")
//		print("randomWithinDaysBeforeToday \(test.timeIntervalSinceNow)")
		XCTAssert(test.timeIntervalSinceNow <= 86400) // 86400 is num seconds in a day
	}
	#endif


	// Array
	func testArray() {
		let testArray = [1,2,3,4,5]
		let test = testArray.randomItem()
		XCTAssert(testArray.contains(test!))
	}


	// ArraySlice
	func testArraySlice() {
		let testArraySlice = [1,2,3,4,5]
		let test = testArraySlice.randomItem()
		XCTAssert(testArraySlice.contains(test!))
	}

	#if !os(Linux)
	// something screwey with URL on foundation in linux
	// URL
	let testURLArray = ["http://www.google.com", "http://leagueoflegends.com/", "https://github.com/", "http://stackoverflow.com/", "https://medium.com/", "http://9gag.com/", "http://imgur.com/", "https://www.youtube.com/"]
	func testURL() {
		let test = URL.random()
		XCTAssert(testURLArray.contains(test.absoluteString))
	}
	func testURLStruct() {
		let test = Randoms.randomURL()
		XCTAssert(testURLArray.contains(test.absoluteString))
	}
	#endif
	func testRandomFakeName() {
		XCTAssert(Randoms.randomFakeName().characters.count > 0)
	}

	func testRandomFakeGender() {
		XCTAssert(["Male","Female"].contains(Randoms.randomFakeGender()))
	}

	func testRandomFakeConversation() {
		XCTAssert(Randoms.randomFakeConversation().characters.count > 0)
	}

	let fakeTitles = ["CEO of Google", "CEO of Facebook", "VP of Marketing @Uber", "Business Developer at IBM", "Jungler @ Fanatic", "B2 Pilot @ USAF", "Student at Stanford", "Student at Harvard", "Mayor of Raccoon City", "CTO @ Umbrella Corporation", "Professor at Pallet Town University"]
	let fakeTags = ["meta", "forum", "troll", "meme", "question", "important", "like4like", "f4f"]
	let fakeCurrencies = ["USD", "EUR", "GBP", "JPY", "AUD", "CAD", "ZAR", "NZD", "INR", "BRP", "CNY", "EGP", "KRW", "MXN", "SAR", "SGD",]

	func testRandomFakeTitle() {
		XCTAssert(fakeTitles.contains(Randoms.randomFakeTitle()))
	}
	func testRandomFakeTag() {
		XCTAssert(fakeTags.contains(Randoms.randomFakeTag()))
	}
	func testRandomFakeNameAndEnglishHonorific() {
		XCTAssert(Randoms.randomFakeNameAndEnglishHonorific().characters.count > 0)
	}
	func testRandomFakeCity() {
		XCTAssert(Randoms.randomFakeCity().characters.count > 0)
	}
	func testRandomFakeCurrency() {
		XCTAssert(fakeCurrencies.contains(Randoms.randomCurrency()))
	}

	static var allTests = [
		("testBool", testBool),
		("testBoolStruct", testBoolStruct),
		("testIntRange", testIntRange),
		("testIntRangeLower", testIntRangeLower),
		("testIntRangeStruct", testIntRangeStruct),
		("testIntRangeLowerStruct", testIntRangeLowerStruct),
		("testInt32Range", testInt32Range),
		("testInt32RangeLower", testInt32RangeLower),
		("testInt32RangeStruct", testInt32RangeStruct),
		("testInt32RangeLowerStruct", testInt32RangeLowerStruct),
		("testRandomPercentageisOverStruct", testRandomPercentageisOverStruct),
		("testDoubleRangeLower", testDoubleRangeLower),
		("testDoubleRangeLowerStruct", testDoubleRangeLowerStruct),
		("testFloatRangeLower", testFloatRangeLower),
		("testFloatRangeLowerStruct", testFloatRangeLowerStruct),
		("testArray", testArray),
		("testArraySlice", testArraySlice),
		("testRandomFakeName", testRandomFakeName),
		("testRandomFakeGender", testRandomFakeGender),
		("testRandomFakeConversation", testRandomFakeConversation),
		("testRandomFakeTitle", testRandomFakeTitle),
		("testRandomFakeTag", testRandomFakeTag),
		("testRandomFakeNameAndEnglishHonorific", testRandomFakeNameAndEnglishHonorific),
		("testRandomFakeCity", testRandomFakeCity),
		("testRandomFakeCurrency", testRandomFakeCurrency)
	]

}
