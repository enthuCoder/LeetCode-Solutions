//
//  424. Longest Repeating Character Replacement.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/26/20.
//

import Foundation

/*
 424. Longest Repeating Character Replacement
 
 Given a string s that consists of only uppercase English letters, you can perform at most k operations on that string.
 In one operation, you can choose any character of the string and change it to any other uppercase English character.
 Find the length of the longest sub-string containing all repeating letters you can get after performing the above operations.

 Note:
 Both the string's length and k will not exceed 104.

 Example 1:
 Input: s = "ABAB", k = 2
 Output: 4
 Explanation: Replace the two 'A's with two 'B's or vice versa.
  
 Example 2:
 Input: s = "AABABBA", k = 1
 Output: 4

 Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.

 */

class Input_424 {
    func executeInput() {
        let s = "AABABBA", k = 1
        print(characterReplacement(s, k))
    }
}

extension Input_424 {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var maxLength = 0
        if s.isEmpty {
            return maxLength
        }
        
        var maxRepeatingCharacterCount = 0
        var left = 0
        var frequencyDict = [Character : Int]()
        var valuesCount: Int {
            return frequencyDict.values.reduce(0, +)
        }
        let inputArray = Array(s)
        
        for i in 0..<inputArray.count {
            let currChar = inputArray[i] as Character
            frequencyDict[currChar, default:0] += 1
            maxRepeatingCharacterCount = max(maxRepeatingCharacterCount, frequencyDict[currChar]!)
            // current window size is from i to left, overall we have a letter which is
            // repeating 'maxRepeatingCharacterCount' times, this means we can have a window which has one letter
            // repeating 'maxRepeatingCharacterCount' times and the remaining letters we should replace.
            // if the remaining letters are more than 'k', it is the time to shrink the window as we
            // are not allowed to replace more than 'k' letters
            if i - left + 1 - maxRepeatingCharacterCount > k {
                let leftChar = inputArray[left]
                frequencyDict[leftChar] = frequencyDict[leftChar]! - 1
                if frequencyDict[leftChar] == 0 {
                    frequencyDict.removeValue(forKey: leftChar)
                }
                left += 1
            }
            maxLength = max(maxLength, i - left + 1)
        }
        return maxLength
    }
}
