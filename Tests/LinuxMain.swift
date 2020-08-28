import XCTest

import UDefaultsTests

var tests = [XCTestCaseEntry]()
tests += StringTests.allTests()
tests += ArrayTests.allTests()
tests += SubstringTests.allTests()
XCTMain(tests)
