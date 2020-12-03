//
//  637. Average of Levels in Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/3/20.
//

import Foundation

/*
 637. Average of Levels in Binary Tree

 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 Example 1:

 Input:
     3
    / \
   9  20
     /  \
    15   7
 Output: [3, 14.5, 11]
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
 Note:

 The range of node's value is in the range of 32-bit signed integer.

 */
class Input_637 {
    func executeInput() {
        
    }
}

extension Input_637 {
    
    func averageOfLevels(_ root: TreeNode<Int>?) -> [Double] {
        var result = [Double]()
        guard let rootNode = root else {
            return result
        }
        
        var stack = [TreeNode<Int>]()
        stack.append(rootNode)
        
        while !stack.isEmpty {
            var rowArray = [Int]()

            // count of stack is frozen at the time when iteration of for-loop starts
            for _ in 0..<stack.count {
                let dequedNode = stack.removeFirst()
                rowArray.append(dequedNode.val)
                
                if let left = dequedNode.left {
                    stack.append(left)
                }
                if let right = dequedNode.right {
                    stack.append(right)
                }
            }
            let average = Double(rowArray.reduce(0, +) / rowArray.count)
            result.append(average)
        }
        return result
    }
    
}
