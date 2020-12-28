//
//  567. Permutation in String.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/28/20.
//

import Foundation

/*
 567. Permutation in String
 
 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

 Example 1:
 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 
 Example 2:
 Input:s1= "ab" s2 = "eidboaoo"
 Output: False

 */

class Input_567 {
    func executeInput() {
        let s1 = "ab", s2 = "eidbaooo"
        print(checkInclusion(s1, s2))
    }
}

// Similar to::
// 438. Find All Anagrams in a String
extension Input_567 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        
        var s1Dict = [Character : Int]()
        var s2Dict = [Character : Int]() // This is for sliding window on s2Dict
        for i in 0..<s1.count {
            s1Dict[s1Array[i], default: 0] += 1
            s2Dict[s2Array[i], default: 0] += 1
        }
        
        for i in 0..<(s2Array.count - s1Array.count) {
            if compareDicts(s1Dict, s2Dict) {
                return true
            }
            s2Dict[s2Array[i]]! -= 1
            if let count = s2Dict[s2Array[i]], count == 0 {
                s2Dict.removeValue(forKey: s2Array[i])
            }
            s2Dict[s2Array[i + s1Array.count], default: 0] += 1
        }
        
        return compareDicts(s1Dict, s2Dict)
    }
    
    func compareDicts(_ dict1: [Character : Int], _ dict2: [Character : Int]) -> Bool {
        return dict1 == dict2
    }
}
