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
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class LinkListDemo {
    static func deleteNode(_ node: ListNode?) {
        node!.val = node!.next!.val
        node!.next = node!.next!.next
    }
}
