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
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
    if (head == nil || k < 0) {
        return nil
    }
    // 有一个头, 但是不知道尾在多远, 首先还是要求出链表长度
    var len = 1;
    var headNode = head
    while (headNode!.next != nil) {
        headNode = headNode!.next
        len += 1;
    }
    
    if ( k > len ) {
        return nil
    }
    
    var kNode : ListNode? = head!
    var target = len - k // 倒数第k个
    while (target > 0) {
        kNode = kNode!.next
        target -= 1
    }
    return kNode
}



//let node5 = ListNode(5, nil)
//let node4 = ListNode(4, node5)
//let node3 = ListNode(3, node4)
//let node2 = ListNode(2, node3)
let node1 = ListNode(1, nil)


print(getKthFromEnd(node1, 1)?.val)
//print(getKthFromEnd(node1, 2)?.val)
//print(getKthFromEnd(node1, 3)?.val)
//print(getKthFromEnd(node1, 4)?.val)
//print(getKthFromEnd(node1, 5)?.val)
//print(getKthFromEnd(node1, 6)?.val)
