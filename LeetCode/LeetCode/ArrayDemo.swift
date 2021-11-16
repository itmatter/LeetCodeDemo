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
}
