import UIKit

var greeting = "Hello, playground"

// 剑指 Offer 48. 最长不含重复字符的子字符串
// 请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

//输入: "abcabcbb"
//输出: 3
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
//
//输入: "bbbbb"
//输出: 1
//解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
//
//输入: "pwwkew"
//输出: 3
//解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
//     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。


func lengthOfLongestSubstring(_ s: String) -> Int {
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


print(lengthOfLongestSubstring("pwwkew"))
