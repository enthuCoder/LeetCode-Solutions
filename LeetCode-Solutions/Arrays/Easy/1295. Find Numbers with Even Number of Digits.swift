//
//  1295. Find Numbers with Even Number of Digits.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 1295. Find Numbers with Even Number of Digits
 
 Given an array nums of integers, return how many of them contain an even number of digits.
  

 Example 1:
 Input: nums = [12,345,2,6,7896]
 Output: 2
 Explanation:
 12 contains 2 digits (even number of digits).
 345 contains 3 digits (odd number of digits).
 2 contains 1 digit (odd number of digits).
 6 contains 1 digit (odd number of digits).
 7896 contains 4 digits (even number of digits).
 Therefore only 12 and 7896 contain an even number of digits.

 Example 2:
 Input: nums = [555,901,482,1771]
 Output: 1
 Explanation:
 Only 1771 contains an even number of digits.
 */

class Input_1295 {
    func executeInput() {
        let nums = [12,345,2,6,7896]
        print("\(findNumbers(nums))")
    }
}

extension Input_1295 {
    func findNumbers(_ nums: [Int]) -> Int {
        var result = 0
        if nums.isEmpty {
            return result
        }
        
        for (_, num) in nums.enumerated() {
            var currNum = num
            var numOfDigits = 0
            while currNum > 0 {
                 currNum = currNum / 10
                numOfDigits += 1
            }
            result += (numOfDigits % 2 == 0) ? 1 : 0
        }
        return result
    }
}
