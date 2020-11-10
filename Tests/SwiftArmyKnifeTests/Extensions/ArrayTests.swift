import XCTest
@testable import SwiftArmyKnife

final class ArrayTests: XCTestCase {
    let testArray = [1,2,3,4,5,6,7,8,9,10]
    
    func testSafeSubscript() {
        XCTAssertEqual(testArray[safe: -1], nil)
        XCTAssertEqual(testArray[safe: 0], 1)
        XCTAssertEqual(testArray[safe: 1], 2)
        XCTAssertEqual(testArray[safe: 2], 3)
        XCTAssertEqual(testArray[safe: 3], 4)
        XCTAssertEqual(testArray[safe: 4], 5)
        XCTAssertEqual(testArray[safe: 5], 6)
        XCTAssertEqual(testArray[safe: 6], 7)
        XCTAssertEqual(testArray[safe: 7], 8)
        XCTAssertEqual(testArray[safe: 8], 9)
        XCTAssertEqual(testArray[safe: 9], 10)
        XCTAssertEqual(testArray[safe: 10], nil)
    }
    
    func testGrouping() {
        let grouped = testArray.grouping(by: { $0 % 2 == 0 ? "even" : "odd" })
        XCTAssertEqual(grouped.keys.count, 2)
        XCTAssertEqual(grouped["even"], [2,4,6,8,10])
        XCTAssertEqual(grouped["odd"], [1,3,5,7,9])
    }
    
    func testSubstringClosedRangeSafe() {
        XCTAssertEqual(testArray[safe: -2...(-1)], ArraySlice<Int>())
        XCTAssertEqual(testArray[safe: -1...3], testArray[0...3])
        
        XCTAssertEqual(testArray[safe: 0...0], testArray[0...0])
        XCTAssertEqual(testArray[safe: 0...3], testArray[0...3])
        XCTAssertEqual(testArray[safe: 3...5], testArray[3...5])
        XCTAssertEqual(testArray[safe: 5...9], testArray[5...9])
        XCTAssertEqual(testArray[safe: 9...9], testArray[9...9])
        
        XCTAssertEqual(testArray[safe: 5...10], testArray[5...9])
        
        XCTAssertEqual(testArray[safe: -1...10], testArray[0...9])
        XCTAssertEqual(testArray[safe: 10...11], ArraySlice<Int>())
    }
    
    func testSubstringRangeSafe() {
        XCTAssertEqual(testArray[safe: -4..<(-2)], ArraySlice<Int>())
        XCTAssertEqual(testArray[safe: -1..<0], ArraySlice<Int>())
        XCTAssertEqual(testArray[safe: -1..<1], testArray[0..<1])
        
        XCTAssertEqual(testArray[safe: 0..<0], testArray[0..<0])
        XCTAssertEqual(testArray[safe: 0..<5], testArray[0..<5])
        XCTAssertEqual(testArray[safe: 3..<5], testArray[3..<5])
        XCTAssertEqual(testArray[safe: 3..<9], testArray[3..<9])
        XCTAssertEqual(testArray[safe: 3..<10], testArray[3..<10])
        XCTAssertEqual(testArray[safe: 10..<10], testArray[10..<10])
        
        XCTAssertEqual(testArray[safe: 3..<11], testArray[3..<10])
        XCTAssertEqual(testArray[safe: 12..<15], ArraySlice<Int>())
        XCTAssertEqual(testArray[safe: -1..<11], testArray[0..<10])
    }
    
    func testSubstringPartialRangeFromSafe() {
        XCTAssertEqual(testArray[safe: (-1)...], testArray[0...])
        
        XCTAssertEqual(testArray[safe: 0...], testArray[0...])
        XCTAssertEqual(testArray[safe: 3...], testArray[3...])
        XCTAssertEqual(testArray[safe: 9...], testArray[9...])
        XCTAssertEqual(testArray[safe: 10...], testArray[10...])
        
        XCTAssertEqual(testArray[safe: 11...], ArraySlice<Int>())
    }
    
    func testSubstringPartialRangeThroughSafe() {
        XCTAssertEqual(testArray[safe: ...(-1)], ArraySlice<Int>())
        XCTAssertEqual(testArray[safe: ...0], testArray[...0])
        XCTAssertEqual(testArray[safe: ...3], testArray[...3])
        XCTAssertEqual(testArray[safe: ...8], testArray[...8])
        XCTAssertEqual(testArray[safe: ...9], testArray[...9])
        XCTAssertEqual(testArray[safe: ...10], testArray[...9])
    }
    
    func testSubstringPartialRangeUpToSafe() {
        XCTAssertEqual(testArray[safe: ..<(-1)], ArraySlice<Int>())
        XCTAssertEqual(testArray[safe: ..<0], testArray[..<0])
        XCTAssertEqual(testArray[safe: ..<3], testArray[..<3])
        XCTAssertEqual(testArray[safe: ..<9], testArray[..<9])
        XCTAssertEqual(testArray[safe: ..<10], testArray[..<10])
        XCTAssertEqual(testArray[safe: ..<11], testArray[..<10])
    }
    
    func testDeduped() {
        let array = [9,5,4,2,7,6,5,6,2,4,9,5,2]
        XCTAssertEqual([9,5,4,2,7,6], array.deduped())
    }
    
    static var allTests = [
        ("testSafeSubscript", testSafeSubscript),
        ("testGrouping", testGrouping),
        ("testSubstringClosedRangeSafe", testSubstringClosedRangeSafe),
        ("testSubstringRangeSafe", testSubstringRangeSafe),
        ("testSubstringPartialRangeFromSafe", testSubstringPartialRangeFromSafe),
        ("testSubstringPartialRangeThroughSafe", testSubstringPartialRangeThroughSafe),
        ("testSubstringPartialRangeUpToSafe", testSubstringPartialRangeUpToSafe),
        ("testDeduped", testDeduped),
    ]
}
