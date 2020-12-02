//
//  230. Kth Smallest Element in a BST.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/2/20.
//

import Foundation

/*
 230. Kth Smallest Element in a BST
 
 Example 1:

 Input: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 Output: 1
 Example 2:

 Input: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 Output: 3
 
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?

 👆 - This can be done using LRU Cache and Doubly Linked List - TBD
  

 Constraints:

 The number of elements of the BST is between 1 to 10^4.
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
 */

class Input_230 {
    
    //let input1 = [1, null, 2, 3]
    
    
    func executeInput() {
        func kthSmallest(_ root: TreeNode<Int>?, _ k: Int) -> Int {
            
            var kthSmallest = k
            let result = inorderTraversal_itr(withRoot: root, k:&kthSmallest)
            return result
        }
    }
}

extension Input_230 {
    
    func inorderTraversal_itr(withRoot root: TreeNode<Int>?, k: inout Int) -> Int {
        if root == nil {
            return -1
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
                k -= 1
                if k == 0 {
                    return removedNode.val
                }
                currNode = removedNode.right
            }
        }
        return -1
    }
}
