//
//  File.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/28/20.
//

import Foundation

/*
 242. Valid Anagram
 
 Given two strings s and t , write a function to determine if t is an anagram of s.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false
 
 Note: You may assume the string contains only lowercase alphabets.

 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 */
class Input_242 {
    func executeInput() {
        let s = "anagram", t = "nagaram"
        print(isAnagram(s, t))
    }
}

extension Input_242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        let sArray = Array(s)
        let tArray = Array(t)
        var sDict = [Character : Int]()
        var tDict = [Character : Int]()
        
        for i in 0..<s.count {
            sDict[sArray[i], default: 0] += 1
            tDict[tArray[i], default: 0] += 1
        }
        return sDict == tDict
    }
}
