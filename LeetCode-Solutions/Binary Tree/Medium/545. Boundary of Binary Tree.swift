//
//  545. Boundary of Binary Tree.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/18/20.
//

import Foundation

/*
 545. Boundary of Binary Tree
 
 A binary tree boundary is the set of nodes (no duplicates) denoting the union of the left boundary, leaves, and right boundary.

 The left boundary is the set of nodes on the path from the root to the left-most node. The right boundary is the set of nodes on the path from the root to the right-most node.

 The left-most node is the leaf node you reach when you always travel to the left subtree if it exists and the right subtree if it doesn't. The right-most node is defined in the same way except with left and right exchanged. Note that the root may be the left-most and/or right-most node.

 Given the root of a binary tree, return the values of its boundary in a counter-clockwise direction starting from the root.

  

 Example 1:


 Input: root = [1,null,2,3,4]
 Output: [1,3,4,2]
 Explanation:
 The left boundary is the nodes [1,2,3].
 The right boundary is the nodes [1,2,4].
 The leaves are nodes [3,4].
 Unioning the sets together gives [1,2,3,4], which is [1,3,4,2] in counter-clockwise order.
 Example 2:


 Input: root = [1,2,3,4,5,6,null,null,null,7,8,9,10]
 Output: [1,2,4,7,8,9,10,6,3]
 Explanation:
 The left boundary are node 1,2,4. (4 is the left-most node according to definition)
 The left boundary is nodes [1,2,4].
 The right boundary is nodes [1,3,6,10].
 The leaves are nodes [4,7,8,9,10].
 Unioning the sets together gives [1,2,3,4,6,7,8,9,10], which is [1,2,4,7,8,9,10,6,3] in counter-clockwise order.
  

 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -1000 <= Node.val <= 1000

 */

class Input_545 {
    func executeInput() {
        // form the sample tree
        let node = input2()
        
        let result = boundaryOfBinaryTree(node)
        print(result)
    }
    
    func input1() -> TreeNode<Int> {
        let rootNode = TreeNode(3)
        
        // Level 1
        let right1 = TreeNode(8)
        let left1 = TreeNode(9)
        rootNode.left = left1
        rootNode.right = right1
        
        // Level 2
        let l2_left1left = TreeNode(4)
        let l2_left1right = TreeNode(0)
        let l2_rigt1left = TreeNode(1)
        let l2_right1right = TreeNode(7)
        left1.left = l2_left1left
        left1.right = l2_left1right
        right1.left = l2_rigt1left
        right1.right = l2_right1right
        
        // Level 3
        let l3_l2_left1right_left = TreeNode(5)
        let l3_l2_rigt1left_left = TreeNode(2)
        l2_left1right.left = l3_l2_left1right_left
        l2_rigt1left.right = l3_l2_rigt1left_left
        
        let testBST = BinarySearchTree<Int>()
        testBST.root = rootNode

        return rootNode
    }
    
    func input2() -> TreeNode<Int> {
        let rootNode = TreeNode(1)
        
        // Level 1
        let right1 = TreeNode(7)
        let left1 = TreeNode(2)
        rootNode.left = left1
        rootNode.right = right1
        
        // Level 2
        let l2_left1left = TreeNode(3)
        let l2_left1right = TreeNode(5)
        let l2_right1right = TreeNode(6)
        left1.left = l2_left1left
        left1.right = l2_left1right
        right1.right = l2_right1right
        
        // Level 3
        let l3_l2_right1right_left = TreeNode(4)
        l2_right1right.left = l3_l2_right1right_left
        
        return rootNode
    }
}

// NOTE: for the below input
/*
 Input = [1,2,7,3,5,null,6,4]

 Output = [1,2,3,4,5,6,7]
 
 So the sequence is: Left Side view ---> Leaf nodes, starting from lowest level ---> Right side view
 
 */

extension Input_545 {
    
    func boundaryOfBinaryTree(_ root: TreeNode<Int>?) -> [Int] {
        var result = [Int]()
        guard let rootNode = root else {
            return result
        }
        
        // Either use Stack or a Double-Ended Queue
        var stack = [(Int, TreeNode<Int>, Bool)]() // Index, Tree Node, isLeaf Node
        stack.append((0, rootNode, isLeaf(rootNode)))
        var lotArray = [[(Int, Int, Bool)]]()
        
        while !stack.isEmpty {
            var rowArray = [(Int, Int, Bool)]() // Index, Value, isLeaf

            // count of stack is frozen at the time when iteration of for-loop starts
            for _ in 0..<stack.count {
                let dequeuedItem = stack.removeFirst()
                rowArray.append((dequeuedItem.0, dequeuedItem.1.val, isLeaf(dequeuedItem.1)))
                
                if let left = dequeuedItem.1.left {
                    stack.append((dequeuedItem.0 - 1, left, isLeaf(left)))
                }
                if let right = dequeuedItem.1.right {
                    stack.append((dequeuedItem.0 + 1, right, isLeaf(right)))
                }
            }
            lotArray.append(rowArray)
        }
        
        result = boundary(&lotArray)
        return result

    }
    
    func boundary(_ lotArray: inout [[(Int, Int, Bool)]]) -> [Int] {
        var boundaryArray = [Int]()
        // Append left side view
        for left in 0..<lotArray.count {
            if let firstItem = lotArray[left].first, firstItem.0 <= 0 {
                boundaryArray.append(firstItem.1)
                lotArray[left].removeFirst()
            }
        }
        // Append leaf nodes from the last level
        if let lastLevel = lotArray.last {
            lastLevel.forEach {
                boundaryArray.append($0.1)
            }
            lotArray.removeLast()
        }
        
        // Append any leaf nodes, if existing, starting from the lowest level
        for levelOrderIndex in stride(from: lotArray.count - 1, through: 0, by: -1) {
            lotArray[levelOrderIndex].forEach { nodeElement in
                if nodeElement.2 {
                    boundaryArray.append(nodeElement.1)
                }
            }
        }
        
        
        // Append right side view
        for right in stride(from: lotArray.count - 1, through: 0, by: -1) {
            if let lastItem = lotArray[right].last, !lastItem.2 { // Right side view with non-leaf node
                boundaryArray.append(lastItem.1)
            }
        }
        return boundaryArray
    }
    
    func isLeaf(_ node: TreeNode<Int>) -> Bool {
        return (node.left == nil && node.right == nil)
    }
}
