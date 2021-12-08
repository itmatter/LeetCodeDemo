//: [Previous](@previous)

import Foundation


// MARK: - 字符串翻转
func reverseString(_ s: inout [Character]) {
    print("reverse before : \(s)")
    // 条件1: 不分配额外的空间
    // 条件2: 原地修改
    // 条件3: O(1)的空间
    // 双指针操作, 双索引操作
    var left = 0;
    var right = s.count - 1;
    
    // 结束条件, left往右, right往左, 直到left>=right
    while(left <= right) {
        // 交换操作
        let temp = s[left];
        s[left] = s[right]
        s[right] = temp;
        
        left += 1;
        right -= 1;
    };
    print("reverse after : \(s)");
}

// 翻转字符串
print("翻转字符串 ========================================")
var reversString: String = "abcdefg"
var charsValue: [Character] = [];
for v in reversString {
    let ch = v as Character;
    charsValue.append(ch);
}

reverseString(&charsValue)
print("reverseString : \(charsValue)")

