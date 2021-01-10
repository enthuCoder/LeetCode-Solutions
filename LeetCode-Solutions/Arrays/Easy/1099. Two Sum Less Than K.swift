//
//  1099. Two Sum Less Than K.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/1/21.
//

import Foundation

/*
 1099. Two Sum Less Than K
 
 Given an array nums of integers and integer k, return the maximum sum such that there exists i < j with nums[i] + nums[j] = sum and sum < k. If no i, j exist satisfying this equation, return -1.

 Example 1:
 Input: nums = [34,23,1,24,75,33,54,8], k = 60
 Output: 58
 Explanation: We can use 34 and 24 to sum 58 which is less than 60.
 
 Example 2:
 Input: nums = [10,20,30], k = 15
 Output: -1
 Explanation: In this case it is not possible to get a pair sum less that 15.

 */

class Input_1099 {
    func executeInput() {
        let nums = [34,23,1,24,75,33,54,8], k = 60
        print(twoSumLessThanK(nums, k))
    }
}

extension Input_1099 {
    func twoSumLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if nums.count < 2 {
            return -1
        }
        var numArray = nums
        numArray.sort(by: { $0 < $1 })
        var left = 0
        var right = nums.count - 1
        var maxSumSoFar = Int.min
        
        while left < right {
            let sum = numArray[left] + numArray[right]
            if sum >= k {
                right -= 1
            } else {
                if maxSumSoFar < sum {
                    maxSumSoFar = sum
                }
                left += 1
            }
        }
        return maxSumSoFar > Int.min ? maxSumSoFar : -1
    }
}
