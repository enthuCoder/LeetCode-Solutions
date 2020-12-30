//
//  167. Two Sum II - Input array is sorted.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/30/20.
//

import Foundation

/*
 167. Two Sum II - Input array is sorted
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

 Note:
 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
  
 Example 1:
 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
 
 Example 2:
 Input: numbers = [2,3,4], target = 6
 Output: [1,3]
 
 Example 3:
 Input: numbers = [-1,0], target = -1
 Output: [1,2]
 */

class Input_167 {
    func executeInput() {
        let numbers = [1,2,3,4,4,9,56,90], target = 8
        print(twoSum(numbers, target))
    }
}

extension Input_167 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var firstIdx = 0
        var secondIdx = numbers.count - 1
        for _ in 0..<numbers.count where secondIdx >= firstIdx {
            if numbers[firstIdx] + numbers[secondIdx] == target {
                // Found the target, break out of the loop
                break
            } else if numbers[firstIdx] + numbers[secondIdx] < target {
                // As sum is lesser than target, increment firstIdx
                firstIdx += 1
            } else if numbers[firstIdx] + numbers[secondIdx] > target {
                // As sum is greater than target, decrement secondIdx
                secondIdx -= 1
            }
        }
        return [firstIdx+1, secondIdx+1]
    }
    
    func twoSum_bkup(_ numbers: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var tempDict = [Int: Int]()
        for (index,value) in numbers.enumerated() {
            if let firstIndex = tempDict[target - value] {
                // Considering these indexes are not 0 based
                result.append(firstIndex+1)
                result.append(index+1)
                break
            }
            tempDict[value] = index
        }
        return result
    }


}
