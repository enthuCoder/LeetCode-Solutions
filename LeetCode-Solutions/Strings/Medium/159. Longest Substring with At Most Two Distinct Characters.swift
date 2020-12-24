//
//  159. Longest Substring with At Most Two Distinct Characters.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/24/20.
//

import Foundation

/*
 159. Longest Substring with At Most Two Distinct Characters
 
 related to #340
 
 Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.

 Example 1:

 Input: "eceba"
 Output: 3
 Explanation: t is "ece" which its length is 3.
 Example 2:

 Input: "ccaabbb"
 Output: 5
 Explanation: t is "aabbb" which its length is 5.
 */

class Input_159 {
    func executeInput() {
        let s = "ccaabbb"
        print(lengthOfLongestSubstringTwoDistinct(s))
    }
}

// Related to: 340. Longest Substring with At Most K Distinct Characters
extension Input_159 {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        let k = 2
        var maxLengthSoFar = 0
        var scannerDict = [Character : Int]()
        var slidingWindowStartIdx = 0
        var slidingWindowEndIdx = 0
        
        for currAlphabet in s {
            
            // Update the scannerDict with character index being visited
            scannerDict[currAlphabet] = slidingWindowEndIdx
            slidingWindowEndIdx += 1
            
            // If number of keys in scannerDict is <= k, update maxLengthSoFar
            if scannerDict.keys.count <= k && (slidingWindowEndIdx - slidingWindowStartIdx > maxLengthSoFar) {
                maxLengthSoFar = slidingWindowEndIdx - slidingWindowStartIdx
            }
            // we have more keys in scannerDict than allowed, move slidingWindow to right one step at a time, and remove the key going out of the window, until number keys allowed become equal to allowed limit
            while scannerDict.keys.count > k {
                if let minValueElement = scannerDict.first(where: { $0.value == scannerDict.values.min() }) {
                    slidingWindowStartIdx = minValueElement.value + 1
                    scannerDict.removeValue(forKey: minValueElement.key)
                }
            }
        }
        return maxLengthSoFar

    }
}
