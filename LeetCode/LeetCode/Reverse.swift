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
    
    //MARK: - 有效的字母异位词
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sHashTable: [Character: Int] = [Character: Int]();
        var sChars : [Character] = [Character]();
        // 用哈希表存一遍统计次数.
        for char in s {
            // 判断哈希表中有没有当前元素
            if (sHashTable[char] != nil) {
                sHashTable[char] = sHashTable[char]! + 1;
            } else {
                // 没有元素
                sHashTable[char] = 1;
                sChars.append(contentsOf: [char])
            }
        }
        
        var tHashTable: [Character: Int] = [Character: Int]();
        var tChars : [Character] = [Character]();
        // 用哈希表存一遍统计次数.
        for char in t {
            // 判断哈希表中有没有当前元素
            if (tHashTable[char] != nil) {
                tHashTable[char] = tHashTable[char]! + 1;
            } else {
                // 没有元素
                tHashTable[char] = 1;
                tChars.append(contentsOf: [char])
            }
        }
        
        if (sChars.count != tChars.count) {
            return false;
        } else {
            // 判断个数是否相同
            for char in sChars {
                if (sHashTable[char] != tHashTable[char] ) {
                    return false;
                }
            }
            return true;
        }
    }
 
    
    //MARK: - 验证回文串
    func isPalindrome(_ s: String) -> Bool {
        // 只考虑字母和数字
        var chars : [String] = [String]() ;
        for char in s {
            let c = String(char).lowercased();
            if ( (c >= "a" && c <= "z") || (c >= "A" && c <= "Z") || (c >= "0" && c <= "9")  ) {
                chars.append(contentsOf: [c])
            }
        }
        
        var left = 0;
        var right = chars.count - 1;
        
        while (left < right) {
            if (chars[left] != chars[right]) {
                return false;
            }
            right -= 1;
            left += 1;
        }
        
        return true;
    }
 
    //MARK: - 字符串转换整数 (atoi)
    func myAtoi(_ s: String) -> Int {
        let chars = s.map{ $0 }
        // 判断每个字节开头是否是空格
        var startIndex = -1;
        var endIndex = -1;
        
        var index = 0;
        for c in chars {
            // 如果遇到
            if (c == " " ) {
                if ( endIndex != -1 ) {
                    break;
                }
            } else if ( c >= "0" && c <= "9") {
                // 0-9
                if ( startIndex == -1 ) {
                    startIndex = index;
                }
                endIndex = index;
            } else if ( c == "-") {
                if ( endIndex != -1 ) {
                    break;
                } else {
                    if ( startIndex == -1 ) {
                        startIndex = index;
                    }
                    endIndex = index;
                }
                
            } else if ( c == "+") {
                if ( endIndex != -1 ) {
                    break;
                } else {
                    if ( startIndex == -1 ) {
                        startIndex = index;
                    }
                    endIndex = index;
                }
                
            } else {
                break;
            }
            index += 1;
        }
        
        if (endIndex != -1) {
            let resultStr = s[s.index(s.startIndex, offsetBy: startIndex)...s.index(s.startIndex, offsetBy: endIndex)]
            let res = (resultStr as NSString).longLongValue;
            // 翻转后, 最大32位, 不允许超过32位
            let maxNum = 1 << 31;
            print("maxNum : \(maxNum)")
            if (res > maxNum - 1 ) {
                return maxNum - 1;
            }
            if (res < -maxNum ){
                return -maxNum;
            }
            return Int(resultStr) ?? 0;
        } else {
            return 0;
        }
    
    }
}





