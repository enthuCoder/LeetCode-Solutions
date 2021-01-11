//
//  244. Shortest Word Distance II.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/10/21.
//

import Foundation

/*
 244. Shortest Word Distance II
 
 */

class Input_244 {
    var wordsDict = [String: [Int]]()

    init(_ words: [String]) {
        for i in 0..<words.count {
            if wordsDict.keys.contains(words[i]) {
                wordsDict[words[i]]?.append(i)
            } else {
                wordsDict[words[i]] = [i]
            }
        }
    }

    func executeInput() {
        let word1 = "coding"
        let word2 = "practice"
        print("\(shortest(word1, word2))")
    }
}

extension Input_244 {
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        var minDistance = Int.max
        
        if let loc1 = wordsDict[word1], let loc2 = wordsDict[word2]  {
            var loc1Idx = 0
            var loc2Idx = 0
            
            while loc1Idx < loc1.count && loc2Idx < loc2.count {
                minDistance = min(minDistance, abs(loc2[loc2Idx] - loc1[loc1Idx]))
                
                if loc1[loc1Idx] < loc2[loc2Idx] {
                    loc1Idx += 1
                } else {
                    loc2Idx += 1
                }
            }
        }
        return minDistance
    }
}
