//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation

let node1 = ListNode(1, nil)
//let node2 = ListNode(2, node1)
//let node3 = ListNode(3, node2)
//let node4 = ListNode(4, node3)
//let node5 = ListNode(5, node4)
//let node6 = ListNode(6, node5)

// 6->5 4 3 2 1 nil

var head : ListNode? = node1

LinkListDemo.removeNthFromEnd(head, 1)


//LinkListDemo.deleteNode(node2)


while (head != nil) {
    print("\(head!.val)")
    head = head!.next
}

