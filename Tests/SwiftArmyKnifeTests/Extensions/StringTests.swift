import XCTest
@testable import SwiftArmyKnife

final class StringTests: XCTestCase {
    let testString = "testString"
    
    func testSubstringClosedRange() {
        XCTAssertEqual(testString[0...0], "t")
        XCTAssertEqual(testString[0...3], "test")
        XCTAssertEqual(testString[3...5], "tSt")
        XCTAssertEqual(testString[5...9], "tring")
        XCTAssertEqual(testString[9...9], "g")
    }
    
    func testSubstringClosedRangeSafe() {
        XCTAssertEqual(testString[safe: -2...(-1)], "")
        XCTAssertEqual(testString[safe: -1...3], "test")
        
        XCTAssertEqual(testString[safe: 0...0], "t")
        XCTAssertEqual(testString[safe: 0...3], "test")
        XCTAssertEqual(testString[safe: 3...5], "tSt")
        XCTAssertEqual(testString[safe: 5...9], "tring")
        XCTAssertEqual(testString[safe: 9...9], "g")
        
        XCTAssertEqual(testString[safe: 5...10], "tring")
        
        XCTAssertEqual(testString[safe: -1...10], "testString")
        XCTAssertEqual(testString[safe: 10...11], "")
    }
    
    func testSubstringRange() {
        XCTAssertEqual(testString[0..<0], "")
        XCTAssertEqual(testString[0..<5], "testS")
        XCTAssertEqual(testString[3..<5], "tS")
        XCTAssertEqual(testString[3..<9], "tStrin")
        XCTAssertEqual(testString[3..<10], "tString")
        XCTAssertEqual(testString[10..<10], "")
    }
    
    func testSubstringRangeSafe() {
        XCTAssertEqual(testString[safe: -4..<(-2)], "")
        XCTAssertEqual(testString[safe: -1..<0], "")
        XCTAssertEqual(testString[safe: -1..<1], "t")
        
        XCTAssertEqual(testString[safe: 0..<0], "")
        XCTAssertEqual(testString[safe: 0..<5], "testS")
        XCTAssertEqual(testString[safe: 3..<5], "tS")
        XCTAssertEqual(testString[safe: 3..<9], "tStrin")
        XCTAssertEqual(testString[safe: 3..<10], "tString")
        XCTAssertEqual(testString[safe: 10..<10], "")
        
        XCTAssertEqual(testString[safe: 3..<11], "tString")
        XCTAssertEqual(testString[safe: 12..<15], "")
        XCTAssertEqual(testString[safe: -1..<11], "testString")
    }
    
    func testSubstringPartialRangeFrom() {
        XCTAssertEqual(testString[0...], "testString")
        XCTAssertEqual(testString[3...], "tString")
        XCTAssertEqual(testString[9...], "g")
        XCTAssertEqual(testString[10...], "")
    }
    
    func testSubstringPartialRangeFromSafe() {
        XCTAssertEqual(testString[safe: (-1)...], "testString")
        
        XCTAssertEqual(testString[safe: 0...], "testString")
        XCTAssertEqual(testString[safe: 3...], "tString")
        XCTAssertEqual(testString[safe: 9...], "g")
        XCTAssertEqual(testString[safe: 10...], "")
        
        XCTAssertEqual(testString[safe: 11...], "")
    }
    
    func testSubstringPartialRangeThrough() {
        XCTAssertEqual(testString[...0], "t")
        XCTAssertEqual(testString[...3], "test")
        XCTAssertEqual(testString[...9], "testString")
    }
    
    func testSubstringPartialRangeThroughSafe() {
        XCTAssertEqual(testString[safe: ...(-1)], "")
        XCTAssertEqual(testString[safe: ...0], "t")
        XCTAssertEqual(testString[safe: ...3], "test")
        XCTAssertEqual(testString[safe: ...8], "testStrin")
        XCTAssertEqual(testString[safe: ...9], "testString")
        XCTAssertEqual(testString[safe: ...10], "testString")
    }
    
    func testSubstringPartialRangeUpTo() {
        XCTAssertEqual(testString[..<0], "")
        XCTAssertEqual(testString[..<3], "tes")
        XCTAssertEqual(testString[..<9], "testStrin")
        XCTAssertEqual(testString[..<10], "testString")
    }
    
    func testSubstringPartialRangeUpToSafe() {
        XCTAssertEqual(testString[safe: ..<(-1)], "")
        XCTAssertEqual(testString[safe: ..<0], "")
        XCTAssertEqual(testString[safe: ..<3], "tes")
        XCTAssertEqual(testString[safe: ..<9], "testStrin")
        XCTAssertEqual(testString[safe: ..<10], "testString")
        XCTAssertEqual(testString[safe: ..<11], "testString")
    }
    
    static var allTests = [
        ("testSubstringClosedRange", testSubstringClosedRange),
        ("testSubstringClosedRangeSafe", testSubstringClosedRangeSafe),
        ("testSubstringRange", testSubstringRange),
        ("testSubstringRangeSafe", testSubstringRangeSafe),
        ("testSubstringPartialRangeFrom", testSubstringPartialRangeFrom),
        ("testSubstringPartialRangeFromSafe", testSubstringPartialRangeFromSafe),
        ("testSubstringPartialRangeThrough", testSubstringPartialRangeThrough),
        ("testSubstringPartialRangeThroughSafe", testSubstringPartialRangeThroughSafe),
        ("testSubstringPartialRangeUpTo", testSubstringPartialRangeUpTo),
        ("testSubstringPartialRangeUpToSafe", testSubstringPartialRangeUpToSafe),
    ]
}
