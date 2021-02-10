//
//  AngleBetweenTests.swift
//  AngleCalcTests
//
//  Created by Matthew Geimer on 2/9/21.
//

import XCTest
@testable import AngleCalc

class AngleBetweenTests: XCTestCase {
    func testValuesWithinRange() {
        let valuesToTest: [(x: CGFloat, limits: (CGFloat, CGFloat), expected: CGFloat?)] = [
            (x: 15, limits: (0, 30), expected: nil), //basic example
            (x: 0, limits: (-15, 15), expected: nil), //negative value in range
            (x: -1, limits: (-15, 15), expected: nil), //negative value in range && negative angle
            (x: 1, limits: (-15, 15), expected: nil), //negative value in range, but positive number
            (x: 90, limits: (0, 0), expected: nil), //range can be interpreted as 360°
            (x: 180, limits: (0, 270), expected: nil), //range greater than 180°
            (x: 180, limits: (45, -45), expected: nil) //range greater than 180° using negative number
        ]
        
        for value in valuesToTest {
            let actual = angleBetween(x: value.x, limits: value.limits)
            XCTAssertEqual(actual, value.expected, "Value should be within range. Test value: \(value)")
        }
    }
    
    func testValuesOutOfRange() {
        let valuesToTest: [(x: CGFloat, limits: (CGFloat, CGFloat), expected: CGFloat?)] = [
            (x: 31, limits: (0, 30), expected: 30), //basic example
            (x: -16, limits: (-15, 15), expected: 345), //negative value in range
            (x: 16, limits: (-15, 15), expected: 15), //negative value in range && negative angle
            (x: -15, limits: (0, 270), expected: 0), //range greater than 180°
            (x: 0, limits: (45, -45), expected: 45) //range greater than 180° using negative number
        ]
        
        for value in valuesToTest {
            let actual = angleBetween(x: value.x, limits: value.limits)
            XCTAssertEqual(actual, value.expected, "Value should not be within range. Test value: \(value)")
        }
    }
}
