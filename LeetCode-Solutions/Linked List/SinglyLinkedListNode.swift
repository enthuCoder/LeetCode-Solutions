//
//  SinglyLinkedListNode.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/1/21.
//

import Foundation

public class SinglyLinkedListNode<T> {
    public var val: T
    public var next: SinglyLinkedListNode?
    
    // public init() { self.val = 0; self.next = nil; }
    
    public init(_ val: T) {
        self.val = val; self.next = nil;
    }
    
    public init(_ val: T, _ next: SinglyLinkedListNode?) {
        self.val = val; self.next = next;
    }
}

// Protocols that a Binary Tree node needs to conform to
extension SinglyLinkedListNode: Equatable where T: Equatable {
    public static func ==(lhs: SinglyLinkedListNode<T>, rhs: SinglyLinkedListNode<T>) -> Bool {
        return lhs.val == rhs.val
    }
}

extension SinglyLinkedListNode: Comparable where T: Comparable {
    public static func < (lhs: SinglyLinkedListNode<T>, rhs: SinglyLinkedListNode<T>) -> Bool {
        return lhs.val < rhs.val
    }
}

extension SinglyLinkedListNode: CustomStringConvertible where T: CustomStringConvertible {
    public var description: String {
        return self.val.description
    }
}
