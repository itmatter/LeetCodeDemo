//: [Previous](@previous)

import Foundation

// 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，
// 分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )
//示例 1：
/**
  输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 */


/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */

class CQueue {
    var stackMain : [Int] = [Int]();    // 主栈
    var stackSub : [Int] = [Int]();     // 副栈(用于倒腾)
    init() {
        // 两个栈实现一个队列
        // 栈的结构, 后进先出
    }
    func appendTail(_ value: Int) {
        // 添加到尾部
        self.stackMain.append(value);

    }
    func deleteHead() -> Int {
        // 如果stackSub还有, 那就返回stackSub最顶层的元素, 知道stackSub为空
        if (!self.stackSub.isEmpty) {
            return self.stackSub.popLast()!
        }
        // stackSub已经为空了,stackMain倒点元素过来吧
        if (!self.stackMain.isEmpty) {
            while (self.stackMain.count > 0) {
                let value = self.stackMain.popLast();
                self.stackSub.append(value!);
            }
            return self.stackSub.popLast()!
        }
        return -1
    }
}

let obj = CQueue()

for i in 0...2 {
    obj.appendTail(i)
}
for _ in 0...1 {
    print(obj.deleteHead())
}
for i in 0...2 {
    obj.appendTail(i)
}
for _ in 0...2 {
    print(obj.deleteHead())
}

