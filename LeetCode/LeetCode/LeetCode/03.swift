//
//  03.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/30.
//

import Foundation
    

// 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
// print(LeetCode03.lengthOfLongestSubstring("abbbbabbbba"))

class LeetCode03 {
   static func lengthOfLongestSubstring(_ s: String) -> Int {
        // 哈希表
        var hashTable = [Character:Int]();
        // 记录最大值
        var result = 0
        
        // 遍历所有的字符
        let chars = s.map{$0}
        
        // 双指针记录
        var start = 0;
        var end = 0;
        for c in chars {
            if (hashTable[c] != nil) {
                start = start > hashTable[c]! + 1  ? start : hashTable[c]! + 1
            }
            hashTable[c] = end
            end += 1
            result = max(result, end - start)
        }
        return result
    }
}
