//
//  145. Binary Tree Postorder Traversal.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 11/25/20.
//

import Foundation

/*
 Given the root of a binary tree, return the postorder traversal of its nodes' values.

 Example 1:

 Input: root = [1,null,2,3]
 Output: [3,2,1]
 
 Example 2:

 Input: root = []
 Output: []
 
 Example 3:

 Input: root = [1]
 Output: [1]
 
 Example 4:

 Input: root = [1,2]
 Output: [2,1]

 Example 5:

 Input: root = [1,null,2]
 Output: [2,1]
  
 Constraints:
 The number of the nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  
 Follow up:
 Recursive solution is trivial, could you do it iteratively?
 */

class Input_145 {
    
    func executeInput() {
        print("145. Binary Tree Postorder Traversal")
        print("- - - - - - - - - - - - - - - - -")
        //let output = inorderTraversal(_ root: TreeNode?)
        
        print("- - - - - - - - - - - - - - - - -\n")

    }
}

extension Input_145 {
    
    func postorderTraversal(_ root: TreeNode<Int>?) -> [Int] {
        var output = [Int]()
        //postorderTraversal_rec(withRoot: root, &output)
        postorderTraversal_itr(withRoot: root, &output)
        return output
    }
    
    func postorderTraversal_rec(withRoot root: TreeNode<Int>?, _ output: inout [Int]) {
        guard let rootNode = root else {
            return
        }
        postorderTraversal_rec(withRoot: rootNode.left, &output)
        postorderTraversal_rec(withRoot: rootNode.right, &output)
        output.append(rootNode.val)
    }
    
    // Reference: Two Stack technique
    //           - https://youtu.be/qT65HltK2uE
    func postorderTraversal_itr(withRoot root: TreeNode<Int>?, _ output: inout [Int]) {
        guard let rootNode = root else {
            return
        }
        var stack1 = [TreeNode<Int>]()
        var stack2 = [TreeNode<Int>]()
        stack1.append(rootNode)
        
        while stack1.isEmpty == false {
            guard let newNode = stack1.popLast() else {
                break
            }
            stack2.append(newNode)
            if newNode.left != nil {
                stack1.append(newNode.left!)
            }
            if newNode.right != nil {
                stack1.append(newNode.right!)
            }
        }
        
        while stack2.isEmpty == false {
            guard let newNode = stack2.popLast() else {
                break
            }
            output.append(newNode.val)
        }
    }
}
