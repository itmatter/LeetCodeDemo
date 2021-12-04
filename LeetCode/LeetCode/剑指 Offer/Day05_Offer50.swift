//
//  Day05_Offer50.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/12/4.
//

import Foundation



// 剑指 Offer 50. 第一个只出现一次的字符
// 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。


//print(Offer50.firstUniqChar("leetcode"))


class Offer50 {
    static func firstUniqChar(_ s: String) -> Character {

        if (s == "") {
            return " "
        }
        // 确定思路 :
        // 第一 : 遍历一遍, 统计所有的字符出现的次数, 然后在遍历一次输出第一次遇到的次数为1的数
        //       最坏情况, 两次for循环
        
        // 第二 : 遍历一次, 双指针, 一个指针往前, 一个指针原地等待遍历.
        
        let chars : [Character] = s.map{$0}
        
        var start = 0
        var end = 0
        
        // 哈希表
        var hashTable = [String : Int]()
        
        while (end < chars.count && start < chars.count) {
            if (hashTable[String(chars[end])] != nil ) {
                // 统计出现的次数
                hashTable[String(chars[end])] = hashTable[String(chars[end])]! + 1
                
                // 如果当前的start的位置指向的内容不为nil
                // start 往前走
                while ( start < chars.count && hashTable[String(chars[start])] != nil &&  hashTable[String(chars[start])]! > 1  ) {
                    start += 1;
                }
                
            } else {
                hashTable[String(chars[end])] = 1
            }
            end += 1
        }
        
        if (start < chars.count ) {
            return chars[start];
        } else {
            return " "
        }
        
    }
}
