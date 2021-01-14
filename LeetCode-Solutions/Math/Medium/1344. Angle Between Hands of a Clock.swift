//
//  1344. Angle Between Hands of a Clock.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 1344. Angle Between Hands of a Clock
 
 Given two numbers, hour and minutes. Return the smaller angle (in degrees) formed between the hour and the minute hand.

 Example 1:
 Input: hour = 12, minutes = 30
 Output: 165
 
 Example 2:
 Input: hour = 3, minutes = 30
 Output: 75
 
 Example 3:
 Input: hour = 3, minutes = 15
 Output: 7.5
 
 Example 4:
 Input: hour = 4, minutes = 50
 Output: 155
 
 Example 5:
 Input: hour = 12, minutes = 0
 Output: 0
 
 */

class Input_1344 {
    func executeInput() {
        let hour = 12, minutes = 30
        print("\(angleClock(hour, minutes))")
    }
}

extension Input_1344 {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let minHandAngle = 6.0 * Double(minutes)

        var hourHandAngle: Double = 0.0
        if hour == 12 {
            hourHandAngle = Double(minHandAngle * 30) / 360.0
        } else if hour < 12 {
            hourHandAngle = Double(hour * 30) + Double(30 * minHandAngle) / 360.0
        }
        
        let absDiff = abs(minHandAngle - hourHandAngle)
        if absDiff < 180.0 {
            return absDiff
        } else {
            return 360.0 - absDiff
        }
    }
}
