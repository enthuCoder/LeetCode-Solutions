//
//  1249. Minimum Remove to Make Valid Parentheses.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 1249. Minimum Remove to Make Valid Parentheses
 
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
 
 Example 1:
 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 
 Example 2:
 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 
 Example 3:
 Input: s = "))(("
 Output: ""
 Explanation: An empty string is also valid.
 
 Example 4:
 Input: s = "(a(b(c)d)"
 Output: "a(b(c)d)"
 
 */

class Input_1249 {
    func executeInput() {
        let s = "lee(t(c)o)de)"
        print("\(minRemoveToMakeValid(s))")
    }
}

extension Input_1249 {
    func minRemoveToMakeValid(_ s: String) -> String {
        var result = ""
        var inputArr = Array(s)
        if s.isEmpty {
            return result
        }
        
        var scannerArr = [(parentheses: Character, index: Int)]()
        for (index, value) in inputArr.enumerated() where value == "(" || value == ")" {
            if value == "(" {
                scannerArr.append((parentheses: value, index: index))
            } else if value == ")" {
                if let str = scannerArr.last?.parentheses, str == "(" {
                    scannerArr.removeLast()
                } else {
                    scannerArr.append((parentheses: value, index: index))

                }
            }
        }
        
        for item in scannerArr {
            inputArr.remove(at: item.index)
        }
        
        result = inputArr.reduce("") { (x, y) in
            x + String(y)
        }
        return result
    }
}
