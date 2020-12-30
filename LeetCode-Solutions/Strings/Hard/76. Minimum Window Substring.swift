//
//  76. Minimum Window Substring.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/28/20.
//

import Foundation

/*
 76. Minimum Window Substring
 
 Given two strings s and t, return the minimum window in s which will contain all the characters in t. If there is no such window in s that covers all characters in t, return the empty string "".
 Note that If there is such a window, it is guaranteed that there will always be only one unique minimum window in s.

 Example 1:
 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 
 Example 2:
 Input: s = "a", t = "a"
 Output: "a"
 */

class Input_76 {
    func executeInput() {
        let s = "ADOBECODEBANC", t = "ABC"
        print(minWindow(s, t))
    }
}

extension Input_76 {
    
    // THIS SOLUTION EXCEEDS THE TIME LIMIT ON LeetCode
    func minWindow(_ s: String, _ t: String) -> String {
        var result = ""
        if s.count * s.count == 0 || t.count > s.count {
            return result
        }
        let sArray = Array(s)
        let tArray = Array(t)
        
        var tDict = [Character : Int]()
        var sDict = [Character : Int]()
        var left = 0
        for i in 0..<t.count {
            tDict[tArray[i], default: 0] += 1
        }
        let matchCountNeeded = tDict.values.reduce(0, +)
        var matchCount = 0
        var firstTimeResAssignment = true
                
        for i in 0..<sArray.count {
            // Aquire and update the sDict, check if matchCount needs to be updated. Once matchCount reaches matchCountNeeded, put this sliding window string as the answer
            // Afterwards, start Releasing, updating matchCount, once it is less than matchCountNeeded, go back to above step
            sDict[sArray[i], default: 0] += 1
            if tDict.keys.contains(sArray[i]) && sDict[sArray[i]]! <= tDict[sArray[i]]! && matchCount < matchCountNeeded {
                matchCount += 1
            }
            
            while matchCount == matchCountNeeded {
                let tempResult = String(sArray[left...i])
                if tempResult.count < result.count || firstTimeResAssignment {
                    result = tempResult
                    firstTimeResAssignment = false
                }
                sDict[sArray[left]]! -= 1
                // Update the match count
                if tDict.keys.contains(sArray[left]) && (sDict[sArray[left]]! < tDict[sArray[left]]!) {
                    matchCount -= 1
                }
                if let charCountRemaining = sDict[sArray[left]], charCountRemaining == 0 {
                    sDict.removeValue(forKey: sArray[left])
                }
                left += 1
            }
        }
        
        return result
    }
}
