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
// 回文链表, (栈)
func isPalindrome(_ head: ListNode?) -> Bool {
    if (head != nil && head?.next == nil) {
        return true;
    }
    var stackArr : [ListNode] = [ListNode]();
    var h = head;
    // 全部压栈
    while (h != nil) {
        stackArr.append(h!)
        h = h?.next
    }
    
    // 一个一个出栈比较
    h = head;
    while (h != nil) {
        // 取出栈顶元素
        let popElment = stackArr.last
        if (popElment!.val != h!.val ) {
            break;
        }
        stackArr.removeLast();
        h = h?.next
    }
    return stackArr.count == 0;
}


let head = ListNode(1, ListNode(2, ListNode(2, ListNode(1, nil))))
//let head = ListNode(1, ListNode(2, ListNode(1, nil)))
//let head = ListNode(1, ListNode(2, nil))
//let head = ListNode(1,nil)
print("是否回文 : \(isPalindrome(head))");
