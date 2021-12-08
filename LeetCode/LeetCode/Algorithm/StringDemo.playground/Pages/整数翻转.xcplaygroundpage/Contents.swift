//: [Previous](@previous)

import Foundation


//MARK: - 整数翻转
/**
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。
 假设环境不允许存储 64 位整数（有符号或无符号）。
 */
func reverseInteger(_ x: Int) -> Int {
    // 整数为准
    var reduceNum = x;
    var result = 0;
    // 正数
    while ( reduceNum / 10 != 0  ) {
        result = result * 10 + reduceNum % 10;
        reduceNum = reduceNum / 10;
    }
    
    // 最后再加一次, 最后一次把个数也加上
    result = result * 10 + reduceNum % 10;
    reduceNum = reduceNum / 10;
    
    
    // 翻转后, 最大32位, 不允许超过32位
    let maxNum = 1 << 31;
    print("maxNum : \(maxNum)")
    if (result > maxNum - 1 || result < -maxNum ) {
        return 0;
    }
    
    return result;
}

print("整数翻转 ========================================")
for index in 0...32 {
    print("2 的\(index + 1)次幂 : \(2 << index) ")
}
print("reverseInteger : \(reverseInteger( 1534236469 ))")
