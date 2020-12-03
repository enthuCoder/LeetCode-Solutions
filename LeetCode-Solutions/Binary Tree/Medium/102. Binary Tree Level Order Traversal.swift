//
//  102. Binary Tree Level Order Traversal.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/3/20.
//

import Foundation

/*
 102. Binary Tree Level Order Traversal
 
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:

 [
   [3],
   [9,20],
   [15,7]
 ]
 */
class Input_102 {
    
    func executeInput() {
        
    }
}

extension Input_102 {
    
    func levelOrder(_ root: TreeNode<Int>?) -> [[Int]] {
        
        var result = [[Int]]()
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
            result.append(rowArray)
        }
        return result
    }
}
