//
//  259. 3Sum Smaller.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/1/21.
//

import Foundation

/*
 259. 3Sum Smaller
 
 Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

 Follow up: Could you solve it in O(n2) runtime?

 Example 1:
 Input: nums = [-2,0,1,3], target = 2
 Output: 2
 Explanation: Because there are two triplets which sums are less than 2:
 [-2,0,1]
 [-2,0,3]
 
 Example 2:
 Input: nums = [], target = 0
 Output: 0
 
 Example 3:
 Input: nums = [0], target = 0
 Output: 0

 */

class Input_259 {
    func executeInput() {
        let nums = [3,1,0,-2]//[-2,0,1,3],
        let target = 4//2
        print(threeSumSmaller(nums, target))
    }
}

extension Input_259 {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return 0
        }
        var numArray = nums
        numArray.sort(by: { $0 < $1 })
        
        var tempDict = [[Int] : Int]()
                
        for i in 0..<nums.count-1 {
            var left = i + 1, right = nums.count - 1
            while left < right {
                let targetDifference = target - numArray[i] - numArray[left] - numArray[right]
                if targetDifference > 0 {
                    tempDict[[numArray[i], numArray[left], numArray[right]], default: 0] += 1
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        var answer = [[Int]]()
        tempDict.forEach { answer.append($0.key) }
        return answer.count
    }
    
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
