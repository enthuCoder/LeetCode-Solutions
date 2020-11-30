//
//  TreeNode.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 11/23/20.
//

import Foundation

// Generic Binary Tree Node
class TreeNode<T> {
    var val: T
    var left: TreeNode?
    var right: TreeNode?
    
    /*init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }*/
    
    init(_ val: T) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    init(_ val: T, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


// Protocols that a Binary Tree node needs to conform to
extension TreeNode: Equatable where T: Equatable {
    static func ==(lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.val == rhs.val
    }
}

extension TreeNode: Comparable where T: Comparable {
    static func < (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.val < rhs.val
    }
}

extension TreeNode: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        return self.val.description
    }
    
}
