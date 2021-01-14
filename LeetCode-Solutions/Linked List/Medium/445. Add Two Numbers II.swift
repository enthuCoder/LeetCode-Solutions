//
//  445. Add Two Numbers II.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/13/21.
//

import Foundation

/*
 445. Add Two Numbers II
 
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

 Example:

 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7
 
 */

class Input_445 {
    
    typealias ListNode = SinglyLinkedListNode<Int>
    
    func executeInput() {
        let l1Head = ListNode(7)
        l1Head.next = ListNode(2)
        l1Head.next?.next = ListNode(4)
        l1Head.next?.next?.next = ListNode(3)
        l1Head.next?.next?.next?.next = nil
        
        let l2Head = ListNode(5)
        l2Head.next = ListNode(6)
        l2Head.next?.next = ListNode(4)
        l2Head.next?.next?.next = nil
        
        print("\(String(describing: addTwoNumbers(l1Head, l2Head)))")
    }
}

extension Input_445 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1List = reverseList(l1)
        var l2List = reverseList(l2)
        var prevNode = ListNode(0)
        var carry = 0
        let head = prevNode
        
        while l1List != nil || l2List != nil || carry != 0 {
            let curr = ListNode(0)
            let sum = (l1List != nil ? l1List!.val : 0) + (l2List != nil ? l2List!.val : 0) + carry
            curr.val = sum % 10
            carry = sum / 10
            prevNode.next = curr
            prevNode = curr
            l1List = l1List == nil ? l1List : l1List!.next
            l2List = l2List == nil ? l2List : l2List!.next
        }
        return reverseList(head.next)
    }
        
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
}
