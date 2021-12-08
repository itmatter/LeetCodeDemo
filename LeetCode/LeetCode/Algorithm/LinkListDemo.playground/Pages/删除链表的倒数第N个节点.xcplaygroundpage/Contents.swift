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




// 删除链表的倒数第N个节点
// 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
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



let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

removeNthFromEnd(node1, 2)
logListList(node1)
