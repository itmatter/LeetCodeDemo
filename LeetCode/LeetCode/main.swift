//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation



/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
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
