//
//  15. 3Sum.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/30/20.
//

import Foundation

/*
 15. 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 Notice that the solution set must not contain duplicate triplets.

 Example 1:
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 
 Example 2:
 Input: nums = []
 Output: []
 
 Example 3:
 Input: nums = [0]
 Output: []
 */

class Input_15 {
    func executeInput() {
        let nums = [-2,0,0,2,2]//[-1,0,1,2,-1,-4]//[-3, 0, 1, 2, -1, 1, -2]
        // output = [[-1,-1,2],[-1,0,1]] //[-3, 1, 2], [-2, 0, 2], [-2, 1, 1], [-1, 0, 1]
        print(threeSum(nums))
    }
}

extension Input_15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int] : Int]()
        if nums.count < 3 {
            return []
        }
        var numArray = nums
        numArray.sort(by: { $0 < $1 })
        
        for i in 0..<nums.count-1 {
            if i > 0 && numArray[i] == numArray[i - 1] {
                continue
            }
            twoSum(i + 1, nums.count - 1, numArray, -numArray[i], &result)
        }
        var answer = [[Int]]()
        result.forEach { answer.append($0.key) }
        return answer
    }
    
    func twoSum(_ start: Int, _ end: Int, _ nums: [Int], _ target: Int, _ res: inout  [[Int] : Int]) {
        var firstIdx = start
        var secondIdx = end
        for _ in firstIdx...secondIdx where secondIdx > firstIdx {
            if nums[firstIdx] + nums[secondIdx] == target {
                var key = [Int]()
                if target == 0 {
                    key = [0] + [nums[firstIdx], nums[secondIdx]]
                } else {
                    key = [-target] + [nums[firstIdx], nums[secondIdx]]
                }
                res[key, default:0] += 1
                firstIdx += 1
                secondIdx -= 1
            } else if nums[firstIdx] + nums[secondIdx] < target {
                // As sum is lesser than target, increment firstIdx
                firstIdx += 1
            } else if nums[firstIdx] + nums[secondIdx] > target {
                // As sum is greater than target, decrement secondIdx
                secondIdx -= 1
            }
        }
    }
}
