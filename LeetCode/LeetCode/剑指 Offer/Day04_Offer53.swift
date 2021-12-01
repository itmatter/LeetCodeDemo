//
//  File.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/12/1.
//

import Foundation

class Offer53 {
    
    //统计一个数字在排序数组中出现的次数。
    // 输入: nums = [5,7,7,8,8,10], target = 8
    // 输出: 2
    static func search(_ nums: [Int], _ target: Int) -> Int {
        //写一个二分法
        var left = 0
        var right = nums.count - 1
        var mid = (right - left) / 2
        while (mid != 0 && mid >= 0 && mid <= nums.count - 1) {
            //  判断
            mid = left + (right - left) / 2
            if (nums[mid] > target && mid <= right) {
                //在左边
                right = mid - 1
            } else if (nums[mid] < target && mid >= left) {
                // 在右边
                left = mid + 1
            } else {
                break
            }
        }
        
        if (mid < 0 || mid > nums.count - 1) {
            return 0
        }
        
        var result = 0
        var i = mid
        var j = mid + 1
        while (i >= 0 && nums[i] == target) {
            i -= 1
            result += 1
        }
        while (j <= nums.count - 1 && nums[j] == target) {
            j += 1
            result += 1
        }
     
        return result
    }
    

}
