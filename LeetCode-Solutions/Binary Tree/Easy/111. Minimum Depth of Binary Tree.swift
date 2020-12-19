//
//  111. Minimum Depth of Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/12/20.
//

import Foundation

/*
 111. Minimum Depth of Binary Tree
 
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 2
 Example 2:

 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5
  

 Constraints:

 The number of nodes in the tree is in the range [0, 105].
 -1000 <= Node.val <= 1000

 
 */

class Input_111 {
    func executeInput() {
        
    }
}

extension Input_111 {
    
    // Can be solved using recursion
    func minDepth(_ root: TreeNode<Int>?) -> Int {
        if root == nil {
           return 0
        }
        if root?.left == nil {
           return minDepth(root?.right) + 1
        }
        if root?.right == nil {
           return minDepth(root?.left) + 1
        }
        return min(minDepth(root?.left), minDepth(root?.right)) + 1
    }

}
