//
//  File.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/30.
//

import Foundation


// 数组中的第K个最大元素
// https://leetcode-cn.com/problems/kth-largest-element-in-an-array/

//给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
//
//请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
//输入: [3,2,1,5,6,4] 和 k = 2
//输出: 5

class LeetCode215 {
    

 

//1．先从数列中取出一个数作为基准数。
//2．分区过程，将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边。
//3．再对左右区间重复第二步，直到各区间只有一个数。
    static func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var arr = nums
        LeetCode215.quickSort(&arr, 0 , arr.count - 1, k)
        print(arr[arr.count - k]);
        return arr[arr.count - k];
    }
    
    
    static func quickSort(_ nums: inout [Int] ,_ left : Int, _ right : Int , _ k : Int ) {
        if (left >= right ) {
            return
        }
        // 快速排序思想
        var i = left
        var j = right
        let base = nums[i]
        while (i<j) {
            // 从右向左找第一个小于baseValue的数，一直找，直到找到或者一直都没有为止
            while (i<j && nums[j] > base) {
                j -= 1
            }
            // 找到了之后
            if (i<j) {
                nums[i] = nums[j]
                i += 1
            }
            // 从左向右找第一个小于baseValue的数，一直找，直到找到或者一直都没有为止
            while (i<j && nums[i] < base) {
                i += 1
            }
            // 如果出来了, 就是找到了
            if (i<j) {
                nums[j] = nums[i]
                j -= 1
            }
        }
        
        nums[i] = base
        if (i - 1 < ( nums.count - k) ) {
            quickSort(&nums, i + 1, right, k)
        } else {
            quickSort(&nums, left, i - 1, k)
        }
    }
}
