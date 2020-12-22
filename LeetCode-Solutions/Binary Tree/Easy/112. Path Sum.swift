//
//  112. Path Sum.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/19/20.
//

import Foundation

/*
 112. Path Sum
 
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

 Note: A leaf is a node with no children.

 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.

 */

class Input_112 {
    func executeInput() {
        let root = input1()
        
        let result = hasPathSum_Itr(root, 22)
        print(result)
    }
    
    func input1() -> TreeNode<Int> {
        let rootNode = TreeNode(5)
        
        let l1_rootNode_left = TreeNode(4)
        rootNode.left = l1_rootNode_left
        let l1_rootNode_right = TreeNode(8)
        rootNode.right = l1_rootNode_right
        
        let l2_l1_rootNode_left_left = TreeNode(11)
        l1_rootNode_left.left = l2_l1_rootNode_left_left
        let l2_l1_rootNode_right_left = TreeNode(13)
        l1_rootNode_right.left = l2_l1_rootNode_right_left
        let l2_l1_rootNode_right_right = TreeNode(4)
        l1_rootNode_right.right = l2_l1_rootNode_right_right
        
        let l3_l2_l1_rootNode_left_left_left = TreeNode(7)
        l2_l1_rootNode_left_left.left = l3_l2_l1_rootNode_left_left_left
        let l3_l2_l1_rootNode_left_left_right = TreeNode(2)
        l2_l1_rootNode_left_left.right = l3_l2_l1_rootNode_left_left_right
        let l3_l2_l1_rootNode_right_right_right = TreeNode(1)
        l2_l1_rootNode_right_right.right = l3_l2_l1_rootNode_right_right_right
        
        return rootNode
    }
}

extension Input_112 {
    
    // Using recursion
    func hasPathSum(_ root: TreeNode<Int>?, _ sum: Int) -> Bool {
        guard let rootNode = root else {
            return false
        }
        if isLeaf(rootNode) && sum == rootNode.val {
            return true
        } else {
            // Check of left or right subtree has the path sum
            return hasPathSum(rootNode.left, sum - rootNode.val) || hasPathSum(rootNode.right, sum - rootNode.val)
        }
    }
    
    func isLeaf(_ node: TreeNode<Int>) -> Bool {
        return node.left == nil && node.right == nil
    }
    
    // Using Preorder traversal
    func hasPathSum_Itr(_ root: TreeNode<Int>?, _ sum: Int) -> Bool {
        guard let rootNode = root else {
            return false
        }
        
        if isLeaf(rootNode) && sum == rootNode.val {
            return true
        }
        
        var stack = [(TreeNode<Int>, Int)]()
        stack.append((rootNode, sum))
        
        while !stack.isEmpty {
            guard let newNode = stack.popLast() else {
                return false
            }
            if isLeaf(newNode.0) && (newNode.1 - newNode.0.val == 0) {
                return true
            }
            if newNode.0.right != nil {
                stack.append((newNode.0.right!, newNode.1 - newNode.0.val))
            }
            if newNode.0.left != nil {
                stack.append((newNode.0.left!, newNode.1 - newNode.0.val))
            }
        }
        return false
    }
    
}
