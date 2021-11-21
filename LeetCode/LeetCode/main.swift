//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation


let node5 = ListNode(5,nil)
let node4 = ListNode(4,node5)
let node3 = ListNode(3,node4)
let node2 = ListNode(2,node3)
let node1 = ListNode(1,node2)

//node5.next = node3

print("是否有环 : \(LinkListDemo.hasCycle(node1))");

//let head = ListNode(1, ListNode(2, ListNode(2, ListNode(1, nil))))
//let head = ListNode(1, ListNode(2, ListNode(1, nil)))
//let head = ListNode(1, ListNode(2, nil))
//let head = ListNode(1,nil)
//print("是否回文 : \(LinkListDemo.isPalindrome(head))");

//let head1 = ListNode(1, ListNode(3, ListNode(5, ListNode(7, ListNode(9, nil)))))
//let head1 = ListNode(0, nil)
//let head2 = ListNode(2, ListNode(4, ListNode(6, ListNode(8, nil))))
//let head2 : ListNode? = nil
// 合并两个有序链表
//let headCom = LinkListDemo.mergeTwoLists(head1,head2);
//LinkListDemo.logListList(headCom);

// 翻转链表
//head = LinkListDemo.reverseList2(head)

//LinkListDemo.removeNthFromEnd(head, 1)

//LinkListDemo.deleteNode(node2)

//logListList(head1);
//logListList(head2);




