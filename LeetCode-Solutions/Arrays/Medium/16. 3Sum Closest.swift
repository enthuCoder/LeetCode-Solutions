//
//  16. 3Sum Closest.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/1/21.
//

import Foundation

/*
 16. 3Sum Closest
 
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

 Example 1:
 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

 */

class Input_16 {
    func executeInput() {
        let nums = [-1,2,1,-4], target = 1
        print(threeSumClosest(nums, target))
    }
}

extension Input_16 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var numArray = nums
        numArray.sort(by: { $0 < $1 })
        
        var minDifference = Int.max
        
        for i in 0..<nums.count-1 {
            var left = i + 1, right = nums.count - 1
            while left < right {
                let targetDifference = target - numArray[i] - numArray[left] - numArray[right]
                if targetDifference == 0 {
                    return target - targetDifference
                }
                if abs(targetDifference) < abs(minDifference) || (abs(targetDifference) == abs(minDifference) && targetDifference < minDifference) {
                    minDifference = targetDifference
                }
                
                if targetDifference > 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return target - minDifference
    }
}
