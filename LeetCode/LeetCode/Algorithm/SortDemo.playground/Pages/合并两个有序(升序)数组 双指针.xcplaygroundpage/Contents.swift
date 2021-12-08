//: [Previous](@previous)

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var index1 = m - 1
    var index2 = n - 1
    var lastIndex = m + n - 1
    
    // 到这来看问题.
    while (lastIndex >= 0) {
        if (index1 < 0) {
            nums1[lastIndex] = nums2[index2]
            index2 -= 1
            lastIndex -= 1;
            continue
        }
        
        if (index2 < 0) {
            nums1[lastIndex] = nums1[index1]
            index1 -= 1
            lastIndex -= 1;
            continue
        }
        
        
        if (nums2[index2] >= nums1[index1]  ) {
            nums1[lastIndex] = nums2[index2]
            index2 -= 1
        } else {
            nums1[lastIndex] = nums1[index1]
            index1 -= 1
        }
        lastIndex -= 1;
    }
    nums1 = Array(nums1.prefix(m+n))
}

var num1 = [2,2,3,0,0,0]
let m = 3
let num2 = [1,1,6]
let n = 3

merge(&num1, m, num2, n)
print(num1)
