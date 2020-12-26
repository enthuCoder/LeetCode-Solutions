//
//  560. Subarray Sum Equals K.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/24/20.
//

import Foundation

/*
 560. Subarray Sum Equals K
 
 Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

  

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2

 */

class Input_560 {
    func executeInput() {
        let nums = [3,9,-2,4,1,-7,2,6,-5,8,-3,-7,6,2]
        let k = 5
        print(subarraySum(nums, k))
    }
}

extension Input_560 {
    
    // O(n)
    // (SUM)end = (NUMS)end-1
    // (SUM)start = (NUMS)start
    
    // Observe the patter with "Sum" array and how it can be used to evaluate subarrays in the original array
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        if nums.count == 0 || (nums.count == 1 && nums.first != k) {
            return 0
        }
        var result = 0
        var sum = 0
        var sumFrequencyDict = [Int:Int]()
        sumFrequencyDict[0] = 1
        
        for i in 0..<nums.count {
            // Update the sum array
            sum += nums[i]
            let remainingSum = sum - k
            // Update the result counter
            if let frequency = sumFrequencyDict[remainingSum] {
                result += frequency
            }
            // Update the frequency dictionary
            sumFrequencyDict[sum, default: 0] += 1
        }
        return result
    }
    
    // Iterate through the array, till sum of sliding window is => k. If equal, add the subArray to the result.
    // If sum is more, start removing elements from the start, untill it is = or < than k. Use new sliding window
    
    // O(N^2)
    func subarraySum_N2(_ nums: [Int], _ k: Int) -> Int {
         var result = 0
        // return 0 is either the array is empty of k is 0
        if nums.count == 0 {
            return result
        }
        
        var sums = Array(repeating: 0, count: nums.count + 1)
        // Create Sums arrays
        for i in 1...nums.count {
            sums[i] = sums[i-1] + nums[i-1]
        }
        
        for i in 0..<nums.count {
            for j in i+1...nums.count {
                if sums[j] - sums[i] == k {
                    result += 1
                }
            }
        }
        
        return result
    }
}
