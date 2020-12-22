//
//  257. Binary Tree Paths.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/21/20.
//

import Foundation

/*
 257. Binary Tree Paths
 
 Given a binary tree, return all root-to-leaf paths.

 Note: A leaf is a node with no children.

 Example:

 Input:

    1
  /   \
 2     3
  \
   5

 Output: ["1->2->5", "1->3"]

 Explanation: All root-to-leaf paths are: 1->2->5, 1->3

 */

class Input_257 {
    func executeInput() {
        let root = input1()
        
        let result = binaryTreePaths(root)
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
        let l3_l2_l1_rootNode_right_right_left = TreeNode(5)
        l2_l1_rootNode_right_right.left = l3_l2_l1_rootNode_right_right_left
        
        return rootNode
    }
}

extension Input_257 {
    func binaryTreePaths(_ root: TreeNode<Int>?) -> [String] {
        var result = [String]()
        guard let rootNode = root else {
            return result
        }
        
        if isLeaf(rootNode) {
            result.append(contentsOf: ["\(rootNode.val)"])
            return result
        }
        
        var stack = [(currNode: TreeNode<Int>, path: String)]()
        stack.append((currNode: rootNode, path: "\(rootNode.val)"))
                
        while !stack.isEmpty {
            guard let newNode = stack.popLast() else {
                return result
            }
            if isLeaf(newNode.currNode) {
                result.append("\(newNode.path)")
            }
            
            if newNode.currNode.right != nil {
                let right = newNode.currNode.right!
                stack.append((currNode: right, path: newNode.path + "->" + "\(right.val)"))
            }
            if newNode.currNode.left != nil {
                let left = newNode.currNode.left!
                stack.append((currNode: left, path: newNode.path + "->" + "\(left.val)"))
            }
        }
        return result

    }
    
    func isLeaf(_ node: TreeNode<Int>) -> Bool {
        return node.left == nil && node.right == nil
    }
}
