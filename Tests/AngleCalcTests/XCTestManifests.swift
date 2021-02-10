import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AngleBetweenTests.allTests),
        testCase(to360Tests.allTests),
    ]
}
#endif
