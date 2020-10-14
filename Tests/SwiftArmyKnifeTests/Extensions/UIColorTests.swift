import XCTest
@testable import SwiftArmyKnife

final class UIColorTests: XCTestCase {
    
    func testRed() {
        let color = UIColor(red: 255, green: 0, blue: 0)
        XCTAssertEqual(color, UIColor.red)
    }
    
    func testGreen() {
        let color = UIColor(red: 0, green: 255, blue: 0)
        XCTAssertEqual(color, UIColor.green)
    }
    
    func testBlue() {
        let color = UIColor(red: 0, green: 0, blue: 255)
        XCTAssertEqual(color, UIColor.blue)
    }
    
    func testHexCodeRed() {
        let color = UIColor(hexCode: "#FF0000")
        XCTAssertEqual(color, UIColor.red)
    }
    
    func testHexCodeGreen() {
        let color = UIColor(hexCode: "#00FF00")
        XCTAssertEqual(color, UIColor.green)
    }
    
    func testHexCodeBlue() {
        let color = UIColor(hexCode: "#0000FF")
        XCTAssertEqual(color, UIColor.blue)
    }
    
    func testHexCodeRedWithAlpha() {
        let color = UIColor(hexCode: "#FF0000CC")
        XCTAssertEqual(color, UIColor.red.withAlphaComponent(0.8))
    }
    
    func testHexCodeGreenWithAlpha() {
        let color = UIColor(hexCode: "#00FF00CC")
        XCTAssertEqual(color, UIColor.green.withAlphaComponent(0.8))
    }
    
    func testHexCodeBlueWithAlpha() {
        let color = UIColor(hexCode: "#0000FFCC")
        XCTAssertEqual(color, UIColor.blue.withAlphaComponent(0.8))
    }
    
    static var allTests = [
        ("testRed", testRed),
        ("testGreen", testGreen),
        ("testBlue", testBlue),
        ("testHexCodeRed", testHexCodeRed),
        ("testHexCodeGreen", testHexCodeGreen),
        ("testHexCodeBlue", testHexCodeBlue),
        ("testHexCodeRedWithAlpha", testHexCodeRedWithAlpha),
        ("testHexCodeGreenWithAlpha", testHexCodeGreenWithAlpha),
        ("testHexCodeBlueWithAlpha", testHexCodeBlueWithAlpha),
    ]
}
