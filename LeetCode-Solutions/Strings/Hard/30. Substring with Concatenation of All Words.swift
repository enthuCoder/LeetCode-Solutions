//
//  30. Substring with Concatenation of All Words.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/3/21.
//

import Foundation

/*
 30. Substring with Concatenation of All Words
 
 You are given a string s and an array of strings words of the same length. Return all starting indices of substring(s) in s that is a concatenation of each word in words exactly once, in any order, and without any intervening characters.

 You can return the answer in any order.

 Example 1:
 Input: s = "barfoothefoobarman", words = ["foo","bar"]
 Output: [0,9]
 Explanation: Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
 The output order does not matter, returning [9,0] is fine too.

 Example 2:
 Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
 Output: []
 
 Example 3:
 Input: s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
 Output: [6,9,12]
 
 */

class Input_30 {
    func executeInput() {
        let s = "wordgoodgoodgoodbestword"//"barfoothefoobarman"
        let words = ["word","good","best","good"]//["foo","bar"]
        print(findSubstring(s, words))
    }
}

extension Input_30 {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var result = [Int]()
        if s.count * words.count == 0 {
            return result
        }
        
        var left = 0
        var right = 0
        var wordsDict = [String: Int]()
        words.forEach { wordsDict[$0, default: 0] += 1 }
        guard  let const = words.first?.count else {
            return result
        }
        let inputArr = Array(s)
        var wordsDictTest = wordsDict
        
        while left <= right && right < inputArr.count {
            let comparedString = inputArr[right..<right+const].reduce("", { $0 + String($1) })
            if wordsDict.keys.contains(comparedString) {
                if wordsDictTest.keys.contains(comparedString) {
                    // Found the comparedString, reduce its count from wordsDictTest
                    wordsDictTest[comparedString]! -= 1
                    if wordsDictTest[comparedString]! == 0 {
                        wordsDictTest.removeValue(forKey: comparedString)
                    }
                    right += const
                    if right - left == wordsDict.values.reduce(0, +) * const {
                        // Found the substring, starting from index left
                        result.append(left)
                        left += const
                        right = left
                        wordsDictTest = wordsDict
                    }
                } else {
                    if right >= const {
                        right -= const
                    }
                    left = right
                    wordsDictTest = wordsDict
                }
            } else {
                right += const
                left = right
                wordsDictTest = wordsDict
            }
        }
        
        return result
    }
}
