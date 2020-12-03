//
//  590. N-ary Tree Postorder Traversal.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/3/20.
//

import Foundation

/*
 590. N-ary Tree Postorder Traversal
 
 Given an n-ary tree, return the postorder traversal of its nodes' values.

 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

  

 Follow up:

 Recursive solution is trivial, could you do it iteratively?

  

 Example 1:



 Input: root = [1,null,3,2,4,null,5,6]
 Output: [5,6,3,2,4,1]

 Example 2:



 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: [2,6,14,11,7,3,12,8,4,13,9,10,5,1]
  

 Constraints:

 The height of the n-ary tree is less than or equal to 1000
 The total number of nodes is between [0, 10^4]

 */


class Input_590 {
    func executeInput() {
        
    }
}

extension Input_590 {
    
    func postorder(_ root: NAryTreeNode<Int>?) -> [Int] {
        
        var result = [Int]()
        
        guard let rootNode = root else {
            return result
        }
        var stack1 = [NAryTreeNode<Int>]()
        var stack2 = [NAryTreeNode<Int>]()
        stack1.append(rootNode)
        
        while stack1.isEmpty == false {
            guard let newNode = stack1.popLast() else {
                break
            }
            stack2.append(newNode)
            for child in newNode.children {
                stack1.append(child)
            }
        }
        
        while stack2.isEmpty == false {
            guard let newNode = stack2.popLast() else {
                break
            }
            result.append(newNode.val)
        }
        return result
    }
}
