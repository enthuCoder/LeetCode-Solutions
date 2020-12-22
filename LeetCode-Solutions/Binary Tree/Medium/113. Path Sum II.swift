//
//  113. Path Sum II.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/21/20.
//

import Foundation

/*
 113. Path Sum II
 
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

 Note: A leaf is a node with no children.

 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 Return:

 [
    [5,4,11,2],
    [5,8,4,5]
 ]

 */

class Input_113 {
    func executeInput() {
        let root = input1()
        
        let result = pathSum(root, 22)
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

extension Input_113 {
    func pathSum(_ root: TreeNode<Int>?, _ sum: Int) -> [[Int]] {
        var result = [[Int]]()
        guard let rootNode = root else {
            return result
        }
        
        if isLeaf(rootNode) && sum == rootNode.val {
            result.append([rootNode.val])
            return result
        }
        
        var stack = [(currNode: TreeNode<Int>, path: [Int], sumRemaining: Int)]() // Tree Node, remaining sum, Column number
        stack.append((currNode: rootNode, path: [rootNode.val], sumRemaining: sum))
                
        while !stack.isEmpty {
            guard let newNode = stack.popLast() else {
                return result
            }
            if isLeaf(newNode.0) && (newNode.sumRemaining == newNode.currNode.val) {
                result.append(newNode.path)
            }
            if newNode.currNode.right != nil {
                let right = newNode.currNode.right!
                stack.append((currNode: right, path: newNode.path + [right.val], sumRemaining: (newNode.sumRemaining - newNode.currNode.val)))
            }
            if newNode.currNode.left != nil {
                let left = newNode.currNode.left!
                stack.append((currNode: left, path: newNode.path + [left.val], sumRemaining: (newNode.sumRemaining - newNode.currNode.val)))
            }
        }
        return result

    }
    
    func isLeaf(_ node: TreeNode<Int>) -> Bool {
        return node.left == nil && node.right == nil
    }

    func pathSum_Rec(_ root: TreeNode<Int>?, _ sum: Int) -> [[Int]] {
        var paths = [[Int]]()
        var path = [Int]()
        hasPaths_helper(root, sum, result: &paths, path: &path)
        print(paths)
        return paths
    }


    func hasPaths_helper(_ root: TreeNode<Int>?, _ sum: Int, result: inout [[Int]], path: inout [Int]) {
        guard let root = root else {
            return
        }
        path.append(root.val)
        if isLeaf(root) && root.val == sum {
            result.append(path)
        } else {
            hasPaths_helper(root.left, sum - root.val, result: &result, path: &path)
            hasPaths_helper(root.right, sum - root.val, result: &result, path: &path)
        }
        path.removeLast()
    }
}
