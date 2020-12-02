//
//  144. Binary Tree Preorder Traversal.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 11/25/20.
//

import Foundation

/*
 Given the root of a binary tree, return the preorder traversal of its nodes' values.

 Example 1:

 Input: root = [1,null,2,3]
 Output: [1,2,3]

 Example 2:

 Input: root = []
 Output: []

 Example 3:

 Input: root = [1]
 Output: [1]

 Example 4:

 Input: root = [1,2]
 Output: [1,2]

 Example 5:

 Input: root = [1,null,2]
 Output: [1,2]
  
 Constraints:
 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  
 Follow up:
 Recursive solution is trivial, could you do it iteratively?
 */

class Input_144 {
    
    func executeInput() {
        print("144. Binary Tree Preorder Traversal")
        print("- - - - - - - - - - - - - - - - -")
        //let output = preorderTraversal(_ root: TreeNode?)
        
        print("- - - - - - - - - - - - - - - - -\n")

    }
}

extension Input_145 {
    
    func preorderTraversal(_ root: TreeNode<Int>?) -> [Int] {
        var output = [Int]()
        // preorderTraversal_rec(withRoot: root, &output)
        preorderTraversal_itr(withRoot: root, &output)
        return output
    }
    
    func preorderTraversal_rec(withRoot root: TreeNode<Int>?, _ output: inout [Int]) {
        guard let rootNode = root else {
            return
        }
        output.append(rootNode.val)
        preorderTraversal_rec(withRoot: rootNode.left, &output)
        preorderTraversal_rec(withRoot: rootNode.right, &output)
    }
    
    // Reference: https://youtu.be/elQcrJrfObg
    func preorderTraversal_itr(withRoot root: TreeNode<Int>?, _ output: inout [Int]) {
        guard let rootNode = root else {
            return
        }
        var stack = [TreeNode<Int>]()
        stack.append(rootNode)
        while stack.isEmpty == false {
            guard let newNode = stack.popLast() else {
                return
            }
            output.append(newNode.val)
            if newNode.right != nil {
                stack.append(newNode.right!)
            }
            if newNode.left != nil {
                stack.append(newNode.left!)
            }
        }
    }
}
