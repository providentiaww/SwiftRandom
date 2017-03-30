//
//  SwiftRandom.swift
//
//  Created by Furkan Yilmaz on 7/10/15.
//  Copyright (c) 2015 Furkan Yilmaz. All rights reserved.
//

// Swift 3 Server Side / SPM conversion by Jonathan Guthrie
// @iamjono
// http://github.com/iamjono

import Foundation

// each type has its own random

public extension Bool {
    /// SwiftRandom extension
    public static func random() -> Bool {
        return Int.random() % 2 == 0
    }
}

public extension Int {
    /// SwiftRandom extension
    public static func random(range: Range<Int>) -> Int {
        return random(lower: range.lowerBound, range.upperBound)
    }

    /// SwiftRandom extension
    public static func random(lower: Int = 0, _ upper: Int = 100) -> Int {
		let rand = URandom()
		let val = abs(rand.int % Int(upper - lower + 1))
		return lower + val
    }
}

public extension Int32 {
    /// SwiftRandom extension
    public static func random(range: Range<Int>) -> Int32 {
        return random(lower: range.lowerBound, range.upperBound)
    }

    /// SwiftRandom extension
    ///
    /// - note: Using `Int` as parameter type as we usually just want to write `Int32.random(13, 37)` and not `Int32.random(Int32(13), Int32(37))`
    public static func random(lower: Int = 0, _ upper: Int = 100) -> Int32 {
		let rand = URandom()
		let val = abs(rand.int32 % Int32(upper - lower + 1))
        return Int32(Int64(val) + Int64(lower))
    }
}

public extension Double {
    /// SwiftRandom extension
    public static func random(lower: Double = 0, _ upper: Double = 100) -> Double {
		let rand = URandom()
        return (Swift.abs(Double(rand.int32)) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension Float {
    /// SwiftRandom extension
    public static func random(lower: Float = 0, _ upper: Float = 100) -> Float {
		let rand = URandom()
        return (Swift.abs(Float(rand.int32)) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension Date {
    /// SwiftRandom extension
    public static func randomWithinDaysBeforeToday(days: Int) -> Date {
        let today = Date()
		let rand = URandom()

        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)

		//        let r1 = arc4random_uniform(UInt32(days))
		//        let r2 = arc4random_uniform(UInt32(23))
		//        let r3 = arc4random_uniform(UInt32(59))
		//        let r4 = arc4random_uniform(UInt32(59))
		let r1 = abs(rand.int % Int(days))
		let r2 = abs(rand.int % Int(32))
		let r3 = abs(rand.int % Int(59))
		let r4 = abs(rand.int % Int(59))



        var offsetComponents = DateComponents()
        offsetComponents.day = Int(r1) * -1
        offsetComponents.hour = Int(r2)
        offsetComponents.minute = Int(r3)
        offsetComponents.second = Int(r4)

        guard let rndDate1 = gregorian.date(byAdding: offsetComponents as DateComponents, to: today as Date, wrappingComponents: true) else {
            print("randoming failed")
            return today
        }
        return rndDate1
    }

    /// SwiftRandom extension
    public static func random() -> Date {
//        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
		let rand = URandom()
		let randomTime = TimeInterval(abs(rand.int % Int(Int32.max)))
        return Date(timeIntervalSince1970: randomTime)
    }

}


public extension Array {
    /// SwiftRandom extension
    public func randomItem() -> Element? {
        guard self.count > 0 else {
            return nil
        }

//		let index = Int(arc4random_uniform(UInt32(self.count)))
		let rand = URandom()
		let index = Int(abs(rand.int % Int(self.count)))
        return self[index]
    }
}

public extension ArraySlice {
    /// SwiftRandom extension
    public func randomItem() -> Element? {
        guard self.count > 0 else {
            return nil
        }
        
        let index = Int.random(lower: self.startIndex, self.endIndex)
        return self[index]
    }
}

public extension URL {
    /// SwiftRandom extension
    public static func random() -> URL {
        let urlList = ["http://www.google.com", "http://leagueoflegends.com/", "https://github.com/", "http://stackoverflow.com/", "https://medium.com/", "http://9gag.com/", "http://imgur.com/", "https://www.youtube.com/"]
        return URL(string: urlList.randomItem()!)!
    }
}


public struct Randoms {

    //==========================================================================================================
    // MARK: - Object randoms
    //==========================================================================================================

    public static func randomBool() -> Bool {
        return Bool.random()
    }

    public static func randomInt(range: Range<Int>) -> Int {
        return Int.random(range: range)
    }

    public static func randomInt(lower: Int = 0, _ upper: Int = 100) -> Int {
        return Int.random(lower: lower, upper)
    }

    public static func randomInt32(range: Range<Int>) -> Int32 {
		return Int32.random(range: range)
    }

    public static func randomInt32(lower: Int = 0, _ upper: Int = 100) -> Int32{
        return Int32.random(lower: lower, upper)
    }

    public static func randomPercentageisOver(percentage: Int) -> Bool {
        return Int.random() > percentage
    }

    public static func randomDouble(lower: Double = 0, _ upper: Double = 100) -> Double {
        return Double.random(lower: upper, lower)
    }

    public static func randomFloat(lower: Float = 0, _ upper: Float = 100) -> Float {
        return Float.random(lower: upper, lower)
    }

    public static func randomDateWithinDaysBeforeToday(days: Int) -> Date {
        return Date.randomWithinDaysBeforeToday(days: days)
    }

    public static func randomDate() -> Date {
        return Date.random()
    }


    public static func randomURL() -> URL {
        return URL.random()
    }



	//==========================================================================================================
	// MARK: - Random data generators
	//==========================================================================================================

	public static func randomAlphaNumericString(length: Int) -> String {
		let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		var randomString = ""
		for _ in 0..<length {
			let randomNum = Randoms.randomInt(lower: 1, allowedChars.characters.count-1)
			let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
			let newCharacter = allowedChars[randomIndex]
			randomString += String(newCharacter)
		}
		return randomString
	}

    //==========================================================================================================
    // MARK: - Fake random data generators
    //==========================================================================================================

    public static func randomFakeName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan"]
        let lastNameList = ["Pearson", "Adams", "Cole", "Francis", "Andrews", "Casey", "Gross", "Lane", "Thomas", "Patrick", "Strickland", "Nicolas", "Freeman"]
        return firstNameList.randomItem()! + " " + lastNameList.randomItem()!
    }

    public static func randomFakeGender() -> String {
        return Bool.random() ? "Male" : "Female"
    }

    public static func randomFakeConversation() -> String {
        let convoList = ["You embarrassed me this evening.","You don't think that was just lemonade in your glass, do you?","Do you ever think we should just stop doing this?","Why didn't he come and talk to me himself?","Promise me you'll look after your mother.","If you get me his phone, I might reconsider.","I think the room is bugged.","No! I'm tired of doing what you say.","For some reason, I'm attracted to you."]
        return convoList.randomItem()!
    }

    public static func randomFakeTitle() -> String {
        let titleList = ["CEO of Google", "CEO of Facebook", "VP of Marketing @Uber", "Business Developer at IBM", "Jungler @ Fanatic", "B2 Pilot @ USAF", "Student at Stanford", "Student at Harvard", "Mayor of Raccoon City", "CTO @ Umbrella Corporation", "Professor at Pallet Town University"]
        return titleList.randomItem()!
    }

    public static func randomFakeTag() -> String {
        let tagList = ["meta", "forum", "troll", "meme", "question", "important", "like4like", "f4f"]
        return tagList.randomItem()!
    }

    private static func randomEnglishHonorific() -> String {
        let englishHonorificsList = ["Mr.", "Ms.", "Dr.", "Mrs.", "Mz.", "Mx.", "Prof."]
        return englishHonorificsList.randomItem()!
    }

    public static func randomFakeNameAndEnglishHonorific() -> String {
        let englishHonorific = randomEnglishHonorific()
        let name = randomFakeName()
        return englishHonorific + " " + name
    }

    public static func randomFakeCity() -> String {
        let cityPrefixes = ["North", "East", "West", "South", "New", "Lake", "Port"]
        let citySuffixes = ["town", "ton", "land", "ville", "berg", "burgh", "borough", "bury", "view", "port", "mouth", "stad", "furt", "chester", "mouth", "fort", "haven", "side", "shire"]
        return cityPrefixes.randomItem()! + citySuffixes.randomItem()!
    }
    
    public static func randomCurrency() -> String {
        let currencyList = ["USD", "EUR", "GBP", "JPY", "AUD", "CAD", "ZAR", "NZD", "INR", "BRP", "CNY", "EGP", "KRW", "MXN", "SAR", "SGD",]
        
        return currencyList.randomItem()!
    }




}

