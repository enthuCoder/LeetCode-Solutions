//
//  103. Binary Tree Zigzag Level Order Traversal.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/12/20.
//

import Foundation

/*
 103. Binary Tree Zigzag Level Order Traversal
 
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

 For example:
 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its zigzag level order traversal as:

 [
   [3],
   [20,9],
   [15,7]
 ]

 */

class Input_103 {
    
    func executeInput() {
        // form the sample tree
        let rootNode = TreeNode(0)
        
        // Level 1
        let right1 = TreeNode(4)
        let left1 = TreeNode(2)
        rootNode.left = left1
        rootNode.right = right1
        
        // Level 2
        let l2_left1left = TreeNode(1)
        let l2_rigt1left = TreeNode(3)
        let l2_right1right = TreeNode(-1)
        left1.left = l2_left1left
        right1.left = l2_rigt1left
        right1.right = l2_right1right
        
        // Level 3
        let l3_l2_left1left_left = TreeNode(5)
        let l3_l2_left1left_right = TreeNode(1)
        let l3_l2_rigt1left_right = TreeNode(6)
        let l3_l2_rigt1right_right = TreeNode(8)
        l2_left1left.left = l3_l2_left1left_left
        l2_left1left.right = l3_l2_left1left_right
        l2_rigt1left.right = l3_l2_rigt1left_right
        l2_right1right.right = l3_l2_rigt1right_right
        
        let testBST = BinarySearchTree<Int>()
        testBST.root = rootNode
        
        _ = testBST.printBinarySearchTree()
        
    }
}

extension Input_103 {
    func zigzagLevelOrder(_ root: TreeNode<Int>?) -> [[Int]] {
        var result = [[Int]]()
        guard let rootNode = root else {
            return result
        }
        
        // Either use Stack or a Double-Ended Queue
        var stack = [TreeNode<Int>]() // Double ended will cause removal of nodes from front and back in constant time
        var leftToRight = true
        stack.append(rootNode)
        
        while !stack.isEmpty {
            var rowArray = [Int]()

            // count of stack is frozen at the time when iteration of for-loop starts
            for _ in 0..<stack.count {
                var dequedNode: TreeNode<Int>
                if leftToRight {
                    // Remove from Front, append at back
                    dequedNode = stack.removeFirst()
                    rowArray.append(dequedNode.val)
                    if let left = dequedNode.left {
                        stack.append(left)
                    }
                    if let right = dequedNode.right {
                        stack.append(right)
                    }
                } else {
                    // Append at front, remove from end
                    dequedNode = stack.removeLast()
                    rowArray.append(dequedNode.val)
                    if let right = dequedNode.right {
                        stack = [right] + stack
                    }
                    if let left = dequedNode.left {
                        stack = [left] + stack
                    }
                }
            }
            result.append(rowArray)
            // Flip the direction for Zigzag traversal
            leftToRight = !leftToRight
        }
        return result
    }
}
