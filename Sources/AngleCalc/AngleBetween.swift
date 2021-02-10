//
//  AngleBetween.swift
//  AngleCalc
//
//  Created by Matthew Geimer on 2/9/21.
//

import SpriteKit

/// Determines whether an angle is within a range of two other angles. If not, returns the limit that's closest to that angle
/// - Parameters:
///   - x: angle to test
///   - limits: limits which angle should be within
/// - Returns: Nil if x is within limits, otherwise returns closest limit to x
public func angleBetween(x: CGFloat, limits: (lower: CGFloat, upper: CGFloat)) -> CGFloat? {
    let angle = to360(x)
    let a = to360(limits.lower)
    let b = to360(limits.upper)

    //Conventional problem. Lower limit is less than upper limit (implying lower limit is non-negative
    if a < b {
        //If angle is within boundaries, then return nil
        if a <= angle && angle <= b {
            return nil
        }
    } else { //Lower limit is greater than upper limit, implying it was less than
        //If angle is within boundaries, then return nil
        if a <= angle || angle <= b {
            return nil
        }
    }
    
    //Otherwise calculate closest limit to the desired angle and return that
    let aDiff = min(abs(angle - a), abs(angle - (a + 360)), abs(angle - (a - 360)))
    let bDiff = min(abs(angle - b), abs(angle - (b + 360)), abs(angle - (b - 360)))
    
    if aDiff <= bDiff {
        return a
    } else {
        return b
    }
}
