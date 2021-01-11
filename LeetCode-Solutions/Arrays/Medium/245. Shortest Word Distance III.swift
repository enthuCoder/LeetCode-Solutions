//
//  245. Shortest Word Distance III.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/10/21.
//

import Foundation

/*
 245. Shortest Word Distance III
 
 */

class Input_245 {
    func executeInput() {
        let words = ["practice", "makes", "perfect", "coding", "makes"]
        let word1 = "makes", word2 = "coding"
        print(shortestWordDistance(words, word1, word2))
    }
}

extension Input_245 {
    func shortestWordDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var wordsDict = [String: [Int]]()
        for i in 0..<words.count {
            if wordsDict.keys.contains(words[i]) {
                wordsDict[words[i]]?.append(i)
            } else {
                wordsDict[words[i]] = [i]
            }
        }

        var minDistance = Int.max
        var loc1Idx = 0
        var loc2Idx = 0
        if word1 == word2 {
            loc2Idx += 1
            if let loc2 = wordsDict[word2], loc2.count > 1 {
                while loc2Idx < loc2.count {
                    minDistance = min(minDistance, loc2[loc2Idx] - loc2[loc1Idx])
                    loc2Idx += 1
                    loc1Idx += 1
                }
            } else {
                minDistance = 0
            }
        } else {
            if let loc1 = wordsDict[word1], let loc2 = wordsDict[word2]  {
                while loc1Idx < loc1.count && loc2Idx < loc2.count {
                    minDistance = min(minDistance, abs(loc2[loc2Idx] - loc1[loc1Idx]))
                    
                    if loc1[loc1Idx] < loc2[loc2Idx] {
                        loc1Idx += 1
                    } else {
                        loc2Idx += 1
                    }
                }
            }
        }
        return minDistance
    }
}
