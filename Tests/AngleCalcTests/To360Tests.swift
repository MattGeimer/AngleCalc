//
//  To360Tests.swift
//  To360Tests
//
//  Created by Matthew Geimer on 2/9/21.
//

import XCTest
@testable import AngleCalc

class to360Tests: XCTestCase {
    func testValuesWithinRange() {
        let valuesToTest: [(CGFloat, CGFloat)] = [
            (0, 0),
            (180, 180),
            (179, 179),
            (181, 181),
            (359, 359)
        ]
        
        for value in valuesToTest {
            XCTAssertEqual(to360(value.0), value.1, "Value within range is changed")
        }
    }
    
    func testNegativeValues() {
        let valuesToTest: [(CGFloat, CGFloat)] = [
            (-45, 315),
            (-180, 180),
            (-360, 0),
            (-361, 359)
        ]
        
        for value in valuesToTest {
            XCTAssertEqual(to360(value.0), value.1, "Value below minimum value is changed")
        }
    }
    
    func testGreaterThan360() {
        let valuesToTest: [(CGFloat, CGFloat)] = [
            (360, 0),
            (361, 1),
            (720, 0),
            (540, 180)
        ]
        
        for value in valuesToTest {
            XCTAssertEqual(to360(value.0), value.1, "Value above maximum value is changes")
        }
    }
}
