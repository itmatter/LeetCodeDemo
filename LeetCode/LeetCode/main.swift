//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
let node6 = ListNode(6)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

var head : ListNode? = node1

LinkListDemo.deleteNode(node2)


while (head != nil) {
    print("\(head!.val)")
    head = head!.next
}

