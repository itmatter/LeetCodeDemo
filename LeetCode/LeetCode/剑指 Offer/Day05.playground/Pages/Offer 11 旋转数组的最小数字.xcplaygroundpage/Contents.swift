//: [Previous](@previous)

import Foundation


// 剑指 Offer 11. 旋转数组的最小数字
// 输入：[3,4,5,1,2]
// 输出：1
// 也就是原数组是1,2,3,4,5
// 旋转过一次之后3,4,5,1,2
// 查找旋转过的最小数字

func minArray(_ numbers: [Int]) -> Int {
    var i = 0
    var j = numbers.count - 1
    var mid = 0;
    while (i<j) {
        // 比较前后两个值
        mid = i + (j - i) / 2
        if (  numbers[mid] <  numbers[j] ) {
            j = mid
        } else  if (  numbers[mid] >  numbers[j] ) {
            i = mid + 1
        } else {
            j -= 1
        }
    }
    return numbers[i]
}


print(minArray([3,4,5,6,1,2,3,3]))

