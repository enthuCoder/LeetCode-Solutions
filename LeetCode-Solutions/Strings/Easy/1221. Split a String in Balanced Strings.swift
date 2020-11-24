//
//  1221. Split a String in Balanced Strings.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 11/23/20.
//

import Foundation

/*
 1221. Split a String in Balanced Strings
 
 Balanced strings are those who have equal quantity of 'L' and 'R' characters.

 Given a balanced string s split it in the maximum amount of balanced strings.

 Return the maximum amount of splitted balanced strings.

  

 Example 1:

 Input: s = "RLRRLLRLRL"
 Output: 4
 Explanation: s can be split into "RL", "RRLL", "RL", "RL", each substring contains same number of 'L' and 'R'.
 
 Example 2:
 
 Input: s = "RLLLLRRRLR"
 Output: 3
 Explanation: s can be split into "RL", "LLLRRR", "LR", each substring contains same number of 'L' and 'R'.

 Example 3:

 Input: s = "LLLLRRRR"
 Output: 1
 Explanation: s can be split into "LLLLRRRR".
 
 Example 4:
 
 Input: s = "RLRRRLLRLL"
 Output: 2
 Explanation: s can be split into "RL", "RRRLLRLL", since each substring contains an equal number of 'L' and 'R'

 Constraints:

 1 <= s.length <= 1000
 s[i] = 'L' or 'R'
 
 */

class Input_1221 {
    
    let input1 = "RLRRLLRLRL"
    let input2 = "RLLLLRRRLR"
    let input3 = "LLLLRRRR"
    let input4 = "RLRRRLLRLL"
    
    func executeInput() {
        
        print("1221. Split a String in Balanced Strings")
        print("- - - - - - - - - - - - - - - - - - - - -")
        let input = [input1, input2, input3, input4]

        // Test for various inputs
        for currentInput in input {
            let testInput = currentInput
            print("INPUT: \(testInput)")
            
            // NOTE: Given input is already a BALANCED string
            let output = balancedStringSplit(testInput)
            print("OUTPUT: \(output)\n")
        }
        print("- - - - - - - - - - - - - - - - - - - - -\n")

    }
    
}

extension Input_1221 {
    
    func balancedStringSplit(_ s: String) -> Int {
        var result = 0
        var balanceFactor = 0
        
        for i in s {
            if i == "R" {
                balanceFactor += 1
            } else if i == "L" {
                balanceFactor -= 1
            }
            if balanceFactor == 0 {
                result += 1
            }
        }
        
        return result
    }
}
