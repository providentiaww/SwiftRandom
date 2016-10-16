import XCTest
import SwiftRandomTestSuite
var tests = [XCTestCaseEntry]()
tests += SwiftRandomTests.allTests()
XCTMain(tests)
