//: [Previous](@previous)

import Foundation

// 只出现一次的数字
func singleNumber(_ nums: [Int]) -> Int {
    // XOR 主要用来判断两个值是否不同。
    // 一个为 true，另一个为 false;
    // 两个都为 true
    // 根据结合律, 也就是
    // a ^ b ^ c ^ d ^ c ^ b ^ a ==  a ^ a ^ b ^ b ^ c ^ c ^ d == 0 ^ 0 ^ 0 ^ d == 0 ^ d
    var reduce = 0;
    for n in nums {
        reduce =  reduce ^ n;
    }
    return reduce;
}

print("\n===============")
var singleNumsArr = [1,4,3,3,4];
print("ArrayDemo.singleNumber(nums) \(singleNumber(singleNumsArr))")


