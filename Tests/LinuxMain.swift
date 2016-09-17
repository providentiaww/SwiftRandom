import XCTest
import SwiftRandomTestSuite
var tests = [XCTestCaseEntry]()
tests += SwiftRandomTestSuite.allTests()
XCTMain(tests)
