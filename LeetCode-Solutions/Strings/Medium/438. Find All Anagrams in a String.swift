//
//  438. Find All Anagrams in a String.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/28/20.
//

import Foundation

/*
 438. Find All Anagrams in a String
 
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
 The order of output does not matter.

 Example 1:
 Input: s: "cbaebabacd" p: "abc"
 Output: [0, 6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".

 Example 2:
 Input: s: "abab" p: "ab"
 Output: [0, 1, 2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 */

class Input_438 {
    func executeInput() {
        let s = "cbaebabacd", p = "abc"
        print(findAnagrams(s, p))
    }
}

extension Input_438 {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var result = [Int]()
        if p.count > s.count {
            return result
        }
        let sArray = Array(s)
        let pArray = Array(p)
        
        var sDict = [Character : Int]()
        var pDict = [Character : Int]() // This is for sliding window on s2Dict
        for i in 0..<p.count {
            pDict[pArray[i], default: 0] += 1
            sDict[sArray[i], default: 0] += 1
        }
        
        for i in 0..<(sArray.count - pArray.count) {
            if compareDicts(sDict, pDict) {
                result.append(i)
            }
            sDict[sArray[i]]! -= 1
            if let count = sDict[sArray[i]], count == 0 {
                sDict.removeValue(forKey: sArray[i])
            }
            sDict[sArray[i + pArray.count], default: 0] += 1
        }
        if compareDicts(sDict, pDict) {
            result.append(sArray.count - pArray.count)
        }
        return result
    }
    
    func compareDicts(_ dict1: [Character : Int], _ dict2: [Character : Int]) -> Bool {
        return dict1 == dict2
    }
}
