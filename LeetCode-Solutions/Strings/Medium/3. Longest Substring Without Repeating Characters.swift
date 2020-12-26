//
//  3. Longest Substring Without Repeating Characters.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/26/20.
//

import Foundation

/*
 3. Longest Substring Without Repeating Characters
 
 Given a string s, find the length of the longest substring without repeating characters.

 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 Example 4:
 Input: s = ""
 Output: 0

 */
class Input_3 {
    func executeInput() {
        let s = "pwwkew"
        print(lengthOfLongestSubstring(s))
    }
}

extension Input_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count < 2 {
            return s.count
        }
        var maxLengthSoFar = 0
        // Key : Character, Value: count of number of occurences
        let stringArray = Array(s)
        var scannerDict = [Character : Int]()
        var slidingWindowStartIdx = 0
        var slidingWindowEndIdx = 0
        
        var tempChecker: Int {
            return scannerDict.values.reduce(0, +)
        }

        for currAlphabet in stringArray {
            // Update the scannerDict with character index being visited
            scannerDict[currAlphabet, default: 0] += 1
            slidingWindowEndIdx += 1
            
            // Check if scannerDict has no values > 1, then update maxLengthSoFar by 1
            if  tempChecker == scannerDict.keys.count {
                if (slidingWindowEndIdx - slidingWindowStartIdx > maxLengthSoFar) {
                    maxLengthSoFar = slidingWindowEndIdx - slidingWindowStartIdx
                }
            }
            // If we have more keys in scannerDict than allowed, move slidingWindow to right one step at a time, and remove the key going out of the window, until number keys allowed become equal to allowed limit
            while tempChecker > scannerDict.keys.count {
                let startElement = stringArray[slidingWindowStartIdx]
                scannerDict[startElement, default: 0] -= 1
                if scannerDict[startElement] == 0 {
                    scannerDict.removeValue(forKey: startElement)
                }
                slidingWindowStartIdx += 1
            }
        }
        return maxLengthSoFar
    }
}
