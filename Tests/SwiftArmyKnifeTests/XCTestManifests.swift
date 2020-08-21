import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StringTests.allTests),
        testCase(ArrayTests.allTests),
    ]
}
#endif
