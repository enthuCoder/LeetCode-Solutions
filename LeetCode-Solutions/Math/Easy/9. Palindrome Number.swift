//
//  9. Palindrome Number.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 9. Palindrome Number
 
 Given an integer x, return true if x is palindrome integer.
 An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

 Example 1:
 Input: x = 15751
 Output: true
 
 Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 Example 3:
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

 */

class Input_9 {
    func executeInput() {
        print(isPalindrome(15751))
    }
}

extension Input_9 {
    func isPalindrome(_ x: Int) -> Bool {
        if x <= 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var y = x
        var palindromeNum = 0
        while y != 0 {
            let modulus = y % 10
            y /= 10
            palindromeNum = palindromeNum * 10 + modulus
        }
        
        if palindromeNum != x {
            return false
        } else {
            return true
        }
    }
}

