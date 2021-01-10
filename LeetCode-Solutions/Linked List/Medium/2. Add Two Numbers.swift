//
//  2. Add Two Numbers.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/1/21.
//

import Foundation

/*
 2. Add Two Numbers
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example 1:
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 
 Example 2:
 Input: l1 = [0], l2 = [0]
 Output: [0]
 
 Example 3:
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 
 */

class Input_2 {
    typealias ListNode = SinglyLinkedListNode<Int>
    
    func executeInput() {
        
    }
}

extension Input_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1List = l1
        var l2List = l2
        var prevNode = ListNode(0)
        var carry = 0
        let head = prevNode
        
        while l1List != nil || l2List != nil || carry != 0 {
            let curr = ListNode(0)
            //let sum = (l1List != nil ? l1List?.val : 0) + (l2List != nil ? l2List!.val : 0) + carry
        }
        return head.next
    }
}
