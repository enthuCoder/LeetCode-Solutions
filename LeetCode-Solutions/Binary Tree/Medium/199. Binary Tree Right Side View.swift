//
//  199. Binary Tree Right Side View.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/18/20.
//

import Foundation

/*
 199. Binary Tree Right Side View
 
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example:

 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---

 */

class Input_199 {
    
    func executeInput() {
        // form the sample tree
        let rootNode = TreeNode(3)
        
        // Level 1
        let right1 = TreeNode(8)
        let left1 = TreeNode(9)
        rootNode.left = left1
        rootNode.right = right1
        
        // Level 2
        let l2_left1left = TreeNode(4)
        let l2_left1right = TreeNode(0)
        let l2_rigt1left = TreeNode(1)
        let l2_right1right = TreeNode(7)
        left1.left = l2_left1left
        left1.right = l2_left1right
        right1.left = l2_rigt1left
        right1.right = l2_right1right
        
        // Level 3
        let l3_l2_left1right_left = TreeNode(5)
        let l3_l2_rigt1left_left = TreeNode(2)
        l2_left1right.left = l3_l2_left1right_left
        l2_rigt1left.right = l3_l2_rigt1left_left
        
        let testBST = BinarySearchTree<Int>()
        testBST.root = rootNode
        
        _ = testBST.printBinarySearchTree()
        
        let result = rightSideView(rootNode)
        print(result)

    }
}

extension Input_199 {
    
    // Do Level Order traversal, and take last element of each Subarray
    func rightSideView(_ root: TreeNode<Int>?) -> [Int] {
        var result = [Int]()
        guard let rootNode = root else {
            return result
        }
        
        // Either use Stack or a Double-Ended Queue
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
            if let lastElement = rowArray.last {
                result.append(lastElement)
            }
        }
        return result
    }


}
