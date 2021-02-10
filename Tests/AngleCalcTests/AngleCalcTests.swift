import XCTest
@testable import AngleCalc

final class AngleCalcTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AngleCalc().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
