//
//  104. Maximum Depth of Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/12/20.
//

import Foundation

/*
 104. Maximum Depth of Binary Tree
 
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 Example 2:

 Input: root = [1,null,2]
 Output: 2
 Example 3:

 Input: root = []
 Output: 0
 Example 4:

 Input: root = [0]
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -100 <= Node.val <= 100

 */

class Input_104 {
    func executeInput() {
        
    }
}

extension Input_104 {
    func maxDepth(_ root: TreeNode<Int>?) -> Int {
        if root == nil {
           return 0
        }
        if root?.left == nil {
           return maxDepth(root?.right) + 1
        }
        if root?.right == nil {
           return maxDepth(root?.left) + 1
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
