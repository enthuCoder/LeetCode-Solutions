//
//  42. Trapping Rain Water.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 42. Trapping Rain Water
 
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
 
 Example 1:
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 
 Example 2:
 Input: height = [4,2,0,3,2,5]
 Output: 9
 */

class Input_42 {
    func executeInput() {
        let height = [0,1,0,2,1,0,1,3,2,1,2,1]
        print("\(trap(height))")
    }
}

extension Input_42 {
    func trap(_ height: [Int]) -> Int {
        var maxSeenSoFar = 0
        var maxSeenRight = Array(repeating: 0, count: height.count)
        var maxSeenLeft = 0

        var total = 0

        for idx in stride(from: height.count - 1, through: 0, by: -1) {
            if height[idx] > maxSeenSoFar {
                maxSeenSoFar = height[idx]
            }
            maxSeenRight[idx] = maxSeenSoFar
        }

        for idx in stride(from: 0, through: height.count - 1, by: 1) {
            total += max(min(maxSeenLeft, maxSeenRight[idx]) - height[idx], 0)
            if height[idx] > maxSeenLeft {
                maxSeenLeft = height[idx]
            }
        }
        
        return total
    }
}
