//
//  ReverseString.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation




class Reverse {
    
    
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
    
    
    
    //MARK: - 字符串中的第一个唯一字符
    func firstUniqChar(_ s: String) -> Int {
        var hashTable: [Character: Int] = [Character: Int]();
        var chars : [Character] = [Character]();
        // 用哈希表存一遍统计次数.
        for char in s {
            // 判断哈希表中有没有当前元素
            if (hashTable[char] != nil) {
                hashTable[char] = hashTable[char]! + 1;
            } else {
                // 没有元素
                hashTable[char] = 1;
                chars.append(contentsOf: [char])
            }
        }

        // 再次重新遍历一次字符串. 用哈希表查询, 如果有值为1的结果, 就是出现了一次的.
        var index = 0;
        for char in s {
            if hashTable[char] == 1 {
                return index;
            }
            index += 1;
        }
        return -1;
    }
}





