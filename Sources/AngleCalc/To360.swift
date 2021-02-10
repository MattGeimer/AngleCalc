//
//  To360.swift
//  AngleCalc
//
//  Created by Matthew Geimer on 2/9/21.
//

import Foundation

/// Determines the value of an angle over the range [0°, 360°]
/// - Parameter val: Angle to recalculate. Measured in degrees.
/// - Returns: Coterminal angle that's within the range [0°, 360°)
public func to360(_ val: CGFloat) -> CGFloat {
    //(360 + angle % 360) % 360
    let uncalibrated = (360 + val.remainder(dividingBy: 360)).remainder(dividingBy: 360)
    
    //Above equation outputs in range (-180, 180]. Convert this to range [0, 360) if angle < 0
    if uncalibrated < 0 {
        return uncalibrated + 360
    }
    
    return uncalibrated
}
