//
//  206. Reverse Linked List.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 206. Reverse Linked List
 
 Reverse a singly linked list.

 Example:
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 
 */

class Input_206 {
    
    typealias ListNode = SinglyLinkedListNode<Int>
    
    func executeInput() {
        
    }
}

extension Input_206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var currNode = head
        var prevNode: ListNode?
        var nextNode: ListNode?
        while currNode != nil {
            nextNode = currNode?.next
            currNode?.next = prevNode
            prevNode = currNode
            currNode = nextNode
        }
        return prevNode
    }
    
    func reverseList_Rec(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let node = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return node
    }
}
