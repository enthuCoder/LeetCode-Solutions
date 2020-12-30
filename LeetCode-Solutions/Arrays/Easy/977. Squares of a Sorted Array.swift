//
//  977. Squares of a Sorted Array.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/30/20.
//

import Foundation

/*
 977. Squares of a Sorted Array
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

 Example 1:
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 
 Example 2:
 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]

 */

class Input_977 {
    func executeInput() {
        let nums = [-5,-3,-2,-1]
        print(sortedSquares(nums))
    }
}

extension Input_977 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        if A.count == 1 {
            return [Int(pow(Double(A.first!), Double(2)))]
        } else {
            var result = [Int]()
            var moveRight = 0
            
            // Evaluate the position of moveLeft and moveRight
            while moveRight < A.count && A[moveRight] < 0 {
                moveRight += 1
            }
            var moveLeft = moveRight - 1
            
            // Iterate through the array, in left and right directions and form the resultant array
            while moveLeft >= 0 && moveRight < A.count {
                let leftItem = Int(pow(Double(A[moveLeft]), Double(2)))
                let rightItem = Int(pow(Double(A[moveRight]), Double(2)))
                if leftItem < rightItem {
                    result.append(leftItem)
                    moveLeft -= 1
                } else {
                    result.append(rightItem)
                    moveRight += 1
                }
            }
            
            // One of the left or right direction hasn't reached the end yet, so iterate once more till the end
            while moveLeft >= 0 {
                let leftItem = Int(pow(Double(A[moveLeft]), Double(2)))
                result.append(leftItem)
                moveLeft -= 1
            }
            while moveRight < A.count {
                let rightItem = Int(pow(Double(A[moveRight]), Double(2)))
                result.append(rightItem)
                moveRight += 1
            }
            
            return result
        }
    }
}
