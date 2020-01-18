import XCTest

import M3UKitTests

var tests = [XCTestCaseEntry]()
tests += M3UDecoderTests.allTests()
tests += M3UEncoderTests.allTests()
XCTMain(tests)
