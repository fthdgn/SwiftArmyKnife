import XCTest
@testable import SwiftArmyKnife

final class SubstringTests: XCTestCase {
    let testString = "testString"
    
    func testAsString() {
        let dropped = testString.dropFirst(5)
        XCTAssertEqual(dropped.asString, "tring")
    }
    
    static var allTests = [
        ("testAsString", testAsString),
    ]
}
