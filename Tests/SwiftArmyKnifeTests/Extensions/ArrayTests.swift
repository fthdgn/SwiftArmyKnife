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
    
    static var allTests = [
        ("testSafeSubscript", testSafeSubscript),
        ("testGrouping", testGrouping),
    ]
}
