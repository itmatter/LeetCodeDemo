import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func logListList(_ head: ListNode?) {
    var headN = head;
    while (headN != nil) {
        print("\(headN!.val)")
        headN = headN!.next
    }
}


// 反转链表(非递归)
func reverseList(_ head: ListNode?) -> ListNode? {
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


let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

reverseList(node1)
logListList(node5)
