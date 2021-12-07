//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reversePrint(_ head: ListNode?) -> [Int] {
   if (head == nil) {
       return [];
   }
   
   // 输入：head = [1,3,2]
   // 输出：[2,3,1]
   var result = [Int]();
   var h = reList(head)
   while (h != nil) {
       result.append(h!.val)
       h = h!.next
   }
   return result;
   
};

// 翻转链表
func reList(_ head: ListNode?) -> ListNode? {
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

let node1 = ListNode(1)
let node2 = ListNode(3)
let node3 = ListNode(2)

node1.next = node2
node2.next = node3

print(reversePrint(node1))

