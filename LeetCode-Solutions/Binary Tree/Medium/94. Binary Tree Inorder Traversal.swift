//
//  94. Binary Tree Inorder Traversal.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 11/23/20.
//

import Foundation

/*
 94. Binary Tree Inorder Traversal
 
 Given the root of a binary tree, return the inorder traversal of its nodes' values.

 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,3,2]
 
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
 Output: [1,2]
  
 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  
 Follow up:

 Recursive solution is trivial, could you do it iteratively?

 */

class Input_94 {
    
    //let input1 = [1, null, 2, 3]
    
    
    func executeInput() {
        print("94. Binary Tree Inorder Traversal")
        print("- - - - - - - - - - - - - - - - -")
        // Form the Input Tree
        let node3 = TreeNode(3)
        let node2 = TreeNode(2)
        node2.left = node3
        let node1 = TreeNode(1)
        node1.right = node2
        
        // Call In-Order Traversal
        let output = inorderTraversal(node1)
        print(output)
        print("- - - - - - - - - - - - - - - - -\n")

    }
}

// 94. Binary Tree Inorder Traversal
extension Input_94 {
        
    func inorderTraversal(_ root: TreeNode<Int>?) -> [Int] {
        var output = [Int]()
        //inorderTraversal_rec(withRoot: root, &output)
        inorderTraversal_itr(withRoot: root, &output)
        return output
    }
    
    /*
     Complexity Analysis

     Time complexity : O(n). The time complexity is O(n) because the recursive function is T(n)=2⋅T(n/2)+1.

     Space complexity : The worst case space required is O(n), and in the average case it's O(logn) where n is number of nodes

     */
    func inorderTraversal_rec(withRoot root: TreeNode<Int>?, _ output: inout [Int]) {
        guard let rootNode = root else {
            return
        }
        inorderTraversal_rec(withRoot: rootNode.left, &output)
        output.append(rootNode.val)
        inorderTraversal_rec(withRoot: rootNode.right, &output)
    }
    
    
    // Reference: https://youtu.be/nzmtCFNae9k
    func inorderTraversal_itr(withRoot root: TreeNode<Int>?, _ output: inout [Int]) {
        if root == nil {
            return
        }
        var stack = [TreeNode<Int>]()
        var currNode: TreeNode<Int>?
        currNode = root
        
        while true {
            // Check if there are nodes on the left. If yes, insert them in stack and set it as currNode.
            if currNode != nil {
                stack.append(currNode!)
                currNode = currNode!.left
            } else {
                if stack.isEmpty {
                    break
                }
                // No more nodes on the left, pop from the stack, add the result, and check if there are right nodes to the currNode
                let removedNode = stack.removeLast()
                output.append(removedNode.val)
                currNode = removedNode.right
            }
        }
    }
}

