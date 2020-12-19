//
//  314. Binary Tree Vertical Order Traversal.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/12/20.
//

import Foundation

/*
 314. Binary Tree Vertical Order Traversal
 
 Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

 If two nodes are in the same row and column, the order should be from left to right.

 Examples 1:

 Input: [3,9,20,null,null,15,7]

    3
   /\
  /  \
  9  20
     /\
    /  \
   15   7

 Output:

 [
   [9],
   [3,15],
   [20],
   [7]
 ]
 Examples 2:

 Input: [3,9,8,4,0,1,7]

      3
     /\
    /  \
   9    8
  /\   /\
 /  \ /  \
 4  0 1   7

 Output:

 [
   [4],
   [9],
   [3,0,1],
   [8],
   [7]
 ]
 Examples 3:

 Input: [3,9,8,4,0,1,7,null,null,null,2,5] (0's right child is 2 and 1's left child is 5)

      3
     /\
    /  \
    9   8
   /\  /\
  /  \/  \
  4  01   7
     /\
    /  \
    5   2

 Output:

 [
   [4],
   [9,5],
   [3,0,1],
   [8,2],
   [7]
 ]

 */

class Input_314 {
    func executeInput() {
        // form the sample tree
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
        
        _ = testBST.printBinarySearchTree()
        
        let result = verticalOrder(rootNode)
        print(result)
    }
}

extension Input_314 {
    
    /*
     Left most node will be part of first column, so do In-Order traversal
     
     While traversing, evaluate the column numbers where a node will fit in.
     
     Create a dictionary, which has col num as its key and corresponding value as items in an array
     
     */
    // Using BFS
    func verticalOrder(_ root: TreeNode<Int>?) -> [[Int]] {
        var result = [[Int]]()
        guard let rootNode = root else  {
            return result
        }
        // This stack will be used for In-Order traversal
        var stack = [(TreeNode<Int>, Int)]()
        stack.append((rootNode, 0))
        
        var stackDictionary = [Int : [Int]]()
        
        while !stack.isEmpty {
            // Count of the stack/array is frozen at the time when the iteration of for-loop starts
            for _ in 0..<stack.count {
                let dequeuedItem = stack.removeFirst()
                insertIntoStackDict(input: &stackDictionary, newKey: dequeuedItem.1, newVal: dequeuedItem.0.val)
                
                if let left = dequeuedItem.0.left {
                    stack.append((left, dequeuedItem.1 - 1))
                }
                if let right = dequeuedItem.0.right {
                    stack.append((right, dequeuedItem.1 + 1))
                }
            }
        }
        
        // Sort the dictionary, so that we start with lowest index column
        // Append each value of the sorted dictionary keys
        stackDictionary.sorted() {
            return $0.0 < $1.0
        } .forEach {
            result.append($0.value)
        }
        return result
    }
    
    func insertIntoStackDict(input: inout [Int: [Int]], newKey: Int, newVal: Int) {
        if input.contains(where: { (key, _) in
            return key == newKey
        }) {
            input[newKey] = input[newKey]! + [newVal]
        } else {
            input[newKey] = [newVal]
        }
    }
    
    // Using DFS - Does not work in terms of order of items in the sub-array in the result
    func verticalOrder_DOES_NOT_WORK(_ root: TreeNode<Int>?) -> [[Int]] {
        var result = [[Int]]()
        if root == nil {
            return result
        }
        
        // This stack will be used for In-Order traversal
        var stack = [(TreeNode<Int>, Int)]()
    
        var currNode: TreeNode<Int>?
        var currCol = 0
        currNode = root
        
        var stackDict = [Int : [Int]]()
        
        while true {
            // Check if there are nodes on the left. If yes, insert them in stack and set it as currNode.
            if currNode != nil {
                stack.append((currNode!, currCol))
                currNode = currNode!.left
                currCol -= 1
            } else {
                if stack.isEmpty {
                    break
                }
                // No more nodes on the left, pop from the stack, add the result, and check if there are right nodes to the currNode
                let removedNode = stack.removeLast()
                //result.append(removedNode.0.val)
                print("\(removedNode.1) : \(removedNode.0.val)")
                if stackDict.keys.contains(removedNode.1) {
                    stackDict[removedNode.1]?.append(removedNode.0.val)
                } else {
                    stackDict[removedNode.1] = [removedNode.0.val]
                }
                currNode = removedNode.0.right
                currCol = removedNode.1 + 1
            }
        }
        stackDict.sorted() {
            return $0.0 < $1.0
        } .forEach {
            result.append($0.value)
        }
        return result
    }
}
