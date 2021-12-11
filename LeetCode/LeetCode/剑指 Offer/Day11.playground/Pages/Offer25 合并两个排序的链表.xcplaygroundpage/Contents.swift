
import Foundation

// 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

//输入：1->2->4, 1->3->4
//输出：1->1->2->3->4->4

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

// 合并两个有序链表 (双指针)
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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



let head1 = ListNode(1, ListNode(3, ListNode(5, ListNode(7, ListNode(9, nil)))))
let head2 = ListNode(2, ListNode(4, ListNode(6, ListNode(8, nil))))

let headCom = mergeTwoLists(head1,head2);
logListList(headCom);
