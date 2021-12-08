import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


// 删除链表中的节点
// 题目数据保证需要删除的节点 不是末尾节点 。
func deleteNode(_ node: ListNode?) {
    node!.val = node!.next!.val
    node!.next = node!.next!.next
}

func logListList(_ head: ListNode?) {
    var headN = head;
    while (headN != nil) {
        print("\(headN!.val)")
        headN = headN!.next
    }
}


let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

deleteNode(node2)
logListList(node1)
