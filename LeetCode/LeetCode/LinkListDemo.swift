//
//  LinkListDemo.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/18.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class LinkListDemo {
    
    static func logListList(_ head: ListNode?) {
        var headN = head;
        while (headN != nil) {
            print("\(headN!.val)")
            headN = headN!.next
        }
    }
    
    
    // 删除链表中的节点
    // 题目数据保证需要删除的节点 不是末尾节点 。
    static func deleteNode(_ node: ListNode?) {
        node!.val = node!.next!.val
        node!.next = node!.next!.next
    }
    
    // 删除链表的倒数第N个节点
    // 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if (head == nil || n < 0) {
            return nil
        }
        // 有一个头, 但是不知道尾在多远, 首先还是要求出链表长度
        var len = 1;
        var headNode = head
        while (headNode!.next != nil) {
            headNode = headNode!.next
            len += 1;
        }
        
        if (len == 1) {
            return nil
        }
        
        var deleteNode : ListNode? = head!
        var target = len - n
        while (target > (n == 1 ? 1 : 0) ) {
            deleteNode = deleteNode!.next
            target -= 1
        }
        
        if (n == 1) {
            deleteNode?.next = nil
        } else {
            deleteNode!.val = deleteNode!.next!.val
            deleteNode!.next = deleteNode!.next!.next
        }
        
        return head
    }
    
    
    // (递归)反转链表
    static func reverseList(_ head: ListNode?) -> ListNode? {
        // 递归的思考
        // 第一步, 思考这个函数的功能 , 返回一个节点的下一个节点.
        // 第二步, 思考这个函数的终止条件, 当前的为空
        // 第三步, 思考这个函数的执行逻辑
        //  返回了当前节点, 当前节点的下一个节点指向上一个递归函数的节点.
        if (head == nil || head?.next == nil) {
            return head;
        }
        
        // 这里不需要思考, 这里的功能函数就是一个节点.
        let reverse = reverseList(head!.next);
        
        // 写出过程
        // 原  6 -> 5 -> 4 -> 3 -> 2 -> 1
        //
        // 思路 :
        //  翻转 : 6 -> 5 -> 4 -> 3 -> 2 -> 1 -> nil
        //  翻转 :      5 -> 4 -> 3 -> 2 -> 1 -> nil
        //  翻转 :           4 -> 3 -> 2 -> 1 -> nil
        //  翻转 :                3 -> 2 -> 1 -> nil
        //  翻转 :                     2 -> 1 -> nil
       
        let next = head!.next;
        print("next : \(next?.val) , head = \(head!.val)" )
        next!.next = head;
        head!.next = nil;
        // 2->1->nil
        // 1->2
        // 2->nil
        
        // 3->2->nil
        // 1->2->3
        // 3->nil
        
        // ...
        // ...
        // ...
        return reverse;
    }
    
    
    // (非递归)翻转链表
    static func reverseList2(_ head: ListNode?) -> ListNode? {
        var nHead : ListNode? = nil;
        var next : ListNode? = nil;
        var pre : ListNode? = nil;

        // 双指针
        next = head;
        // 原  6 -> 5 -> 4 -> 3 -> 2 -> 1
        while (next != nil) {
            // 获取当前head的节点
            pre = next;
            // 先指向head的下一个节点
            next = next?.next;
            // 新的pre的下一个节点指向nHead, 形成翻转
            pre!.next = nHead;
            // 新的nHead的下一个节点指向
            nHead = pre;
        }
        return nHead;
    }
    
    
    // 合并两个有序链表 (双指针)
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 == nil && l2 == nil) {
            return nil;
        }
        if (l1 == nil) {
            return l2
        }
        if (l2 == nil) {
            return l1
        }
        
        var list1Node = l1;
        var list2Node = l2;
        
        var head : ListNode? = nil;
        var next : ListNode? = nil;

        // 初始条件
        if (list1Node!.val <= list2Node!.val) {
            head = list1Node;
            list1Node = list1Node?.next;
        } else {
            head = list2Node;
            list2Node = list2Node?.next;
        }
        next = head;
        
        
        while(list1Node != nil && list2Node != nil) {
            // 下一个条件
            if (list1Node!.val <= list2Node!.val) {
                next?.next = list1Node;
                list1Node = list1Node?.next;
            } else {
                next?.next = list2Node;
                list2Node = list2Node?.next;
            }
            next = next?.next;
        }
        
        //加上后面的
        while (list1Node != nil) {
            next?.next = list1Node;
            list1Node = list1Node?.next;
            next = next?.next;
        }
        
        //加上后面的
        while (list2Node != nil) {
            next?.next = list2Node;
            list2Node = list2Node?.next;
            next = next?.next;
        }
        
        return head;
    }
    
}
