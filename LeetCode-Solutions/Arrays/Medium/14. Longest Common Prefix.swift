//
//  14. Longest Common Prefix.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 14. Longest Common Prefix
 
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".

 Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.

 */

class Input_14 {
    func executeInput() {
        let strs = ["flower","flow","flight"]
        print(longestCommonPrefix(strs))
    }
}

extension Input_14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
    
        var shortestPrefix = strs.first!
        var shortestPrefixLength = shortestPrefix.count

        // Find shortest string
        for pref in strs {
            let charCount = pref.count
            if charCount == 0 {
                return ""
            }
            if charCount < shortestPrefixLength {
                shortestPrefix = pref
                shortestPrefixLength = pref.count
            }
        }

        // Find prefix
        for item in strs {
            while !item.hasPrefix(shortestPrefix) {
                // Prefix doesn't match, check for a smaller prefix match
                shortestPrefix = shortestPrefix.substring(to: shortestPrefix.index(shortestPrefix.endIndex, offsetBy: -1))
                if shortestPrefix.isEmpty {
                    return ""
                }
            }
        }
        return shortestPrefix
    }
}
