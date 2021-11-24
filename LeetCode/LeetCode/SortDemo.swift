//
//  SortDemo.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/24.
//

import Foundation


class SortDemo {
    
    // 合并两个有序(升序)数组 双指针
    // 234 000
    // 123
    
    // 230 004
    // 200 034
    
    // 1  2   2      3
    static func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
      
        var index1 = m - 1
        var index2 = n - 1
        var lastIndex = m + n - 1
        
        
        // 到这来看问题.
        while (lastIndex >= 0) {
            if (index1 < 0) {
                nums1[lastIndex] = nums2[index2]
                index2 -= 1
            } else if (index2 < 0) {
                nums1[lastIndex] = nums1[index1]
                index1 -= 1
            } else {
                if (nums2[index2] >= nums1[index1]  ) {
                    nums1[lastIndex] = nums2[index2]
                    index2 -= 1
                } else {
                    nums1[lastIndex] = nums1[index1]
                    index1 -= 1
                }
            }
            lastIndex -= 1;
        }
        nums1 = Array(nums1.prefix(m+n))

        print(nums1)
    }
    
}