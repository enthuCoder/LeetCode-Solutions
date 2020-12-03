//
//  NAryTreeNode.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/3/20.
//

import Foundation

class NAryTreeNode<T> {
    public var val: T
    public var children: [NAryTreeNode<T>]
    public init(_ val: T) {
        self.val = val
        self.children = []
    }
}
