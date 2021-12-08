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

// 环形链表 (快慢指针)
func hasCycle(_ head: ListNode?) -> Bool {
    // 只有一个节点
    if (head == nil || (head != nil && head?.next == nil )) {
        return false;
    }
    
    var slow : ListNode? = head;
    var fast : ListNode? = head?.next
    // 如果有环, 快慢指针相遇,就退出判断
    // 如果没有环, 快慢指针判断是否遇到头了
    var isCycle = false;
    while ( slow != nil || fast != nil ) {
        if (slow === fast) {
            isCycle = true;
            break;
        }
        // 走一步
        slow = slow?.next;
        // 走两步
        fast = fast?.next?.next;
    }
    
    return isCycle
}


let node5 = ListNode(5,nil)
let node4 = ListNode(4,node5)
let node3 = ListNode(3,node4)
let node2 = ListNode(2,node3)
let node1 = ListNode(1,node2)
node5.next = node3
print("是否有环 : \(hasCycle(node1))");
