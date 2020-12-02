//
//  285. Inorder Successor in BST.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/2/20.
//

import Foundation

/*
 285. Inorder Successor in BST
 
    Given a binary search tree and a node in it, find the in-order successor of that node in the BST.

    The successor of a node p is the node with the smallest key greater than p.val.

     

    Example 1:


    Input: root = [2,1,3], p = 1
    Output: 2
    Explanation: 1's in-order successor node is 2. Note that both p and the return value is of TreeNode type.
    Example 2:


    Input: root = [5,3,6,2,4,null,null,1], p = 6
    Output: null
    Explanation: There is no in-order successor of the current node, so the answer is null.
     

    Note:

    If the given node has no in-order successor in the tree, return null.
    It's guaranteed that the values of the tree are unique.
*/
class Input_285 {
    
    func executeInput() {
        
        
    }
}


extension Input_285 {
        
    func inorderSuccessor(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?) -> TreeNode<Int>? {
        
        var result: TreeNode<Int>?
        
        if root == nil {
            return result
        }
        var stack = [TreeNode<Int>]()
        var currNode: TreeNode<Int>?
        var pickNext = false

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
                if pickNext {
                    result = removedNode
                    break
                }
                if removedNode.val == p?.val { // Matched the given node, prepare for picking the successor
                    pickNext = true
                }
                currNode = removedNode.right
            }
        }
        return result
    }
}
