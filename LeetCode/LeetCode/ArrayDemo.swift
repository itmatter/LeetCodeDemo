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
    
}
