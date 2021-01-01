//
//  1. Two Sum.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/30/20.
//

import Foundation

/*
 1. Two Sum
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.

 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 Example 2:
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 Example 3:
 Input: nums = [3,3], target = 6
 Output: [0,1]

 */

class Input_1 {
    func executeInput() {
        
    }
}

extension Input_1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var tempDict = [Int: Int]()
        
        for (index,value) in nums.enumerated() {
            
            // Store the index of value being traversed in the dictionary, if target - value does not already exist in the dictionary
            if let firstIndex = tempDict[target - value] {
                // When the target - value is found in the dictionary, you will get both the indices
                result.append(firstIndex)
                result.append(index)
                break
            }
            tempDict[value] = index
        }
        return result
    }


}
