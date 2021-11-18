//
//  Array.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/16.
//

import Foundation

class ArrayDemo {
    // 原地删除数组中的重复项, 给一个有序数组
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        if (nums.count == 0) {
            return 0;
        }
        var tar = nums[0];
        var len = 1;
        // 1  1  2
        for n in nums {
            if ( tar != n ) {
                tar = n;
                len += 1
                nums[len - 1] = n;
            }
        }
        
        print("整理后的数组, \(nums)")
        return len;
    }
    
    
    // 买卖股票的最佳时机 II 贪心算法
    static func maxProfit(_ prices: [Int]) -> Int {
        if (prices.count < 1) {
            return 0;
        }
        
        var pre = 0;
        var max = 0;
        while ( pre + 1 < prices.count) {
            let diff = (prices[pre + 1]) - prices[pre];
            if (diff > 0) {
                max += diff
            }
            pre += 1;
        }
        
        return max;
    }
    
    
    // 旋转数组
    static func reserve(_ nums:inout [Int], left: Int, right: Int) {
        // 翻转数组
        var left = left;
        var right = right;
        
        var temp = 0;
        
        while (left < right) {
            temp = nums[left];
            nums[left] = nums[right];
            nums[right] = temp;
            left += 1;
            right -= 1;
        }
    }
    static func rotate(_ nums: inout [Int], _ k: Int) {
        var index = k ;
        if ( index > nums.count ) {
            index = index % nums.count
        }
        // 旋转数组
        ArrayDemo.reserve(&nums, left: 0, right: nums.count - 1);
        ArrayDemo.reserve(&nums, left: 0, right: index - 1);
        ArrayDemo.reserve(&nums, left: index, right: nums.count - 1);
        print(nums);
    }
    
    
    // 存在重复元素
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        // 创建一个哈希表
        var hashMap : Dictionary<String, Int> = [:];
        var isContainsDuplicate = false;
        var index = 0;
        while ( index < nums.count ) {
            if ( hashMap[String(nums[index])] != nil ) {
                isContainsDuplicate = true;
                break;
            }
            hashMap.updateValue(index, forKey: String(nums[index]))
            index += 1;
        }
        return isContainsDuplicate;

    }
    
    
    // 只出现一次的数字
    static func singleNumber(_ nums: [Int]) -> Int {
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
    
    
    
    // 两个数组的交集 II 哈希表
    static func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        // 一个存hashMap
        // 一个遍历
        var hashMap : Dictionary<String, Int> = [:];

        var result : [Int] = [Int]();
        
        // 存储到哈希表中
        _ = nums1.map { value in
            if (hashMap[String(value)] == nil ) {
                hashMap[String(value)] = 1
            } else if (hashMap[String(value)] != nil) {
                hashMap[String(value)] = hashMap[String(value)]! + 1
            }
        }
        
        _ = nums2.map { value in
            if (hashMap[String(value)] != nil && hashMap[String(value)] != 0 ) {
                result.append(value)
                hashMap[String(value)] = hashMap[String(value)]! - 1
            }
        }
        
        return result;

        
    }
    
    
    
    // 移动零
    static func moveZeroes(_ nums: inout [Int]) {
        if (nums.count < 2) {
            return;
        }
        var start = 0;
        var end = 1;
        while (end < nums.count) {
            if ((nums[start] != 0 && nums[end] != 0) || (nums[start] != 0 && nums[end] == 0)) {
                start += 1;
            } else if ( nums[start] == 0 && nums[end] != 0) {
                let temp = nums[end]
                nums[end] = nums[start]
                nums[start] = temp
            }
            
            end += 1;

        }
        
        
    }
    
    
}
