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
    
    static var allTests = [
        ("testSafeSubscript", testSafeSubscript),
    ]
}
