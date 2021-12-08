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


// 反转链表(递归)
func reverseList(_ head: ListNode?) -> ListNode? {
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
 
    let next = head!.next;
    next!.next = head;
    head!.next = nil;
    return reverse;
}


let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

reverseList(node1)
logListList(node5)
