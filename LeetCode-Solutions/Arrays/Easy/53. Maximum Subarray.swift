//
//  53. Maximum Subarray.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/22/20.
//

import Foundation

/*
 53. Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

 Example 1:

 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Example 2:

 Input: nums = [1]
 Output: 1
 Example 3:

 Input: nums = [0]
 Output: 0
 Example 4:

 Input: nums = [-1]
 Output: -1
 Example 5:

 Input: nums = [-2147483647]
 Output: -2147483647
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -231 <= nums[i] <= 231 - 1

 */

class Input_53 {
    func executeInput() {
        let nums = [-2, -1]//[-2,1,-3,4,-1,2,1,-5,4]
        let result = maxSubArray(nums)
        print(result)
    }
}

extension Input_53 {
    
    // Kadane's algorithm
    // Look for explanation here: https://youtu.be/VMtyGnNcdPw
    // O(n^2)
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.reduce(0, +)
        }

        var currentSumSoFar = 0
        var maxSumSoFar = Int.min
        for i in 0..<nums.count {
            if (currentSumSoFar > 0) {
                currentSumSoFar += nums[i]
            } else {
                currentSumSoFar = nums[i]
            }
            
            if currentSumSoFar > maxSumSoFar {
                maxSumSoFar = currentSumSoFar
            }
        }
        return maxSumSoFar
    }
    
    // Find all the subarrays then calculate the sum of its elements to see which one is maximum
    // Below solution runs in O(n^2)
    func maxSubArray_N2(_ nums: [Int]) -> Int {
        var result: Int = Int.min
        
        for outerIdx in 0..<nums.count {
            var subarray = [Int]()
            for innerIdx in outerIdx..<nums.count {
                subarray.append(nums[innerIdx])
                let sum = subarray.reduce(0, +)
                if result < sum {
                    result = sum
                }
            }
        }
        return result
    }
}
