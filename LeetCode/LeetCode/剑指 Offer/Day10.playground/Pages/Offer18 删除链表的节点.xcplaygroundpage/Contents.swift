
import Foundation


//剑指 Offer 18. 删除链表的节点
//给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。
//返回删除后的链表的头节点。
//
//示例 1:
//输入: head = [4,5,1,9], val = 5
//输出: [4,1,9]
//解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
//
//示例 2:
//输入: head = [4,5,1,9], val = 1
//输出: [4,5,9]
//解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
//说明：
//
//题目保证链表中节点的值互不相同

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func logListList(_ head: ListNode?) {
    var headN = head;
    while (headN != nil) {
        print(" \(headN!.val)")
        headN = headN!.next
    }
}

// 双指针
func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    var targetNode = head
    var preNode = head
    while(targetNode != nil) {
        if (targetNode!.val == val) {
            // 判断是否是最后一个节点
            if (targetNode!.next != nil) {
                // 如果不是, 删除当前的下一个节点
                // 1,2,3,4,5,6
                                                            // targetNode = node3
                let temp = targetNode!.next!.next           // temp = node5
                targetNode!.val = targetNode!.next!.val     // node3!.val = 4
                targetNode!.next!.next = nil                // node4->next = nil
                targetNode!.next = temp                     // node3->next = node5
            } else {
                // 如果是, 删除最后一个节点
                preNode!.next = nil
            }
            break;
        }
        preNode = targetNode
        targetNode = targetNode!.next
    }
    return head
}


var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)
var node4 = ListNode(4)
var node5 = ListNode(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

deleteNode(node1, 1)
print(">>>>>>>>>>>>>>>>>>>>>>>")
logListList(node1);
