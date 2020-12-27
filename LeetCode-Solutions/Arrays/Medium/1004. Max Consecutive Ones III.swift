//
//  1004. Max Consecutive Ones III.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/26/20.
//

import Foundation

/*
 1004. Max Consecutive Ones III
 
 Given an array A of 0s and 1s, we may change up to K values from 0 to 1.
 Return the length of the longest (contiguous) subarray that contains only 1s.

 Example 1:
 Input: A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
 Output: 6
 Explanation: [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.
 
 Example 2:
 Input: A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
 Output: 10
 Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.

 */

class Input_1004 {
    func executeInput() {
        let A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
        print(longestOnes(A, K))
    }
}

extension Input_1004 {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var maxLength = 0
        if A.isEmpty {
            return maxLength
        }
        
        var maxRepeatingOnesCount = 0
        var left = 0
        var frequencyDict = [Int : Int]() // Key will be either 1 or 0
        var valuesCount: Int {
            return frequencyDict.values.reduce(0, +)
        }
        
        for i in 0..<A.count {
            let currVal = A[i]
            frequencyDict[currVal, default:0] += 1
            if currVal == 1 {
                maxRepeatingOnesCount = max(maxRepeatingOnesCount, frequencyDict[currVal]!)
            }
            // current window size is from i to left, overall we have 1s which is
            // repeating 'maxRepeatingOnesCount' times, this means we can have a window which has 1s
            // repeating 'maxRepeatingOnesCount' times and the remaining 0s we should replace.
            // if the remaining 0s are more than 'k', it is the time to shrink the window as we
            // are not allowed to replace more than 'k' letters
            if i - left + 1 - maxRepeatingOnesCount > K {
                let leftVal = A[left]
                frequencyDict[leftVal] = frequencyDict[leftVal]! - 1
                if frequencyDict[leftVal] == 0 {
                    frequencyDict.removeValue(forKey: leftVal)
                }
                left += 1
            }
            maxLength = max(maxLength, i - left + 1)
        }
        return maxLength
    }
}
