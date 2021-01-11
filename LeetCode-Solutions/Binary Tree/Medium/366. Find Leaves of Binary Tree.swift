//
//  366. Find Leaves of Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/11/21.
//

import Foundation

/*
 366. Find Leaves of Binary Tree
 
 */

class Input_366 {
    func executeInput() {
        // form the sample tree
        let rootNode = TreeNode(1)
        
        // Level 1
        let right1 = TreeNode(3)
        let left1 = TreeNode(2)
        rootNode.left = left1
        rootNode.right = right1
        
        // Level 2
        let l2_left1left = TreeNode(4)
        let l2_left1right = TreeNode(5)
        left1.left = l2_left1left
        left1.right = l2_left1right
        
        print("\(findLeaves(rootNode))")
    }
}

extension Input_366 {
    func findLeaves(_ root: TreeNode<Int>?) -> [[Int]] {
        var result = [[Int]]()
        guard let _ = root else {
            return result
        }
        // Dictionary to contain depth of Leaf as key and values as array of node values at that depth
        var heightDict = [Int : [Int]]()
        let upperLimit = height(root, dict: &heightDict)
        
        for i in 1...upperLimit {
            if let leaves = heightDict[i] {
                result.append(leaves)
            }
        }

        return result
    }
    
    // This function populates heightDict with Keys and Values and returns the max height at the end
    func height(_ node: TreeNode<Int>?, dict: inout [Int : [Int]]) -> Int {
        guard  let node = node else { return 0 }
        let currHeight = max(height(node.left, dict: &dict), height(node.right, dict: &dict)) + 1
        dict[currHeight, default: []].append(node.val)
        return currHeight
    }
}
