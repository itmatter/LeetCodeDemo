//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.min()
 */

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
print( obj.stackArrA)

print( obj.min())
obj.pop()
print( obj.top())
print( obj.min())

