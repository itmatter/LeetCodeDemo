import Cocoa

// 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。
class MinStack {
    /** initialize your data structure here. */
    var stackArrA : [Int] = [Int]() // 先进, 后出
    var stackArrB : [Int] = [Int]() // 先进, 后出

    init() {

    }
    
    // 时间复杂度1
    func push(_ x: Int) {
        self.stackArrA.append(x)
        if (self.stackArrB.isEmpty ) {
            self.stackArrB.append(x)
        } else if (self.stackArrB.last! >= x) {
            self.stackArrB.append(x)
        }
    }
    
    // 时间复杂度1
    func pop() {
        if (self.stackArrA.isEmpty) {
            return;
        }
        if (self.stackArrA.last == self.stackArrB.last) {
            self.stackArrB.removeLast()
        }
        self.stackArrA.removeLast()
    }
    
    // 时间复杂度1
    func top() -> Int {
        if (self.stackArrA.isEmpty) {
            return 0
        }
        return self.stackArrA.last!
    }
    
    // 时间复杂度1
    func min() -> Int {
        if (self.stackArrB.isEmpty) {
            return 0;
        }
        return self.stackArrB.last!
    }
}
