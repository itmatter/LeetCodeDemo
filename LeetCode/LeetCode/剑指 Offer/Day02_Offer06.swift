//
//  Day02_Offer06.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/29.
//

import Foundation



// Offer06 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
// 翻转链表
class Offer06 {
    static func reversePrint(_ head: ListNode?) -> [Int] {
        if (head == nil) {
            return [];
        }
        
        // 输入：head = [1,3,2]
        // 输出：[2,3,1]
        var result = [Int]();
        var h = Offer06.reList(head)
        while (h != nil) {
            result.append(h!.val)
            h = h!.next
        }
        return result;
        
    };
    
    // 翻转链表
    static func reList(_ head: ListNode?) -> ListNode? {
        // 终止条件取参数本身
        if (head == nil || head?.next == nil) {
            return head;
        }
        let res = reList(head?.next)
        // 做一个翻转,head的下一个的节点指向head, 这个时候head就可以指向nil
        // head因为一直递归, 所以head一直到最后面一个. 也就是把后面一个翻转就可以了
        let next = head!.next;
        next!.next = head;
        head!.next = nil;
        return res
    }
}
