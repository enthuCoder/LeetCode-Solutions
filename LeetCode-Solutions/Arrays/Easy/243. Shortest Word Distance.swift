//
//  243. Shortest Word Distance.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/10/21.
//

import Foundation

/*
 243. Shortest Word Distance
 
 */

class Input_243 {
    func executeInput() {
        
    }
}

extension Input_243 {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var left = -1, right = -1
        var minDistance = words.count
        for i in stride(from: 0, to: words.count, by: 1) {
            if words[i] == word1 {
                left = i
            } else if words[i] == word2 {
                right = i
            }
            if left != -1 && right != -1 {
                minDistance = min(minDistance, abs(right - left))
            }
        }
        return minDistance
    }
}
