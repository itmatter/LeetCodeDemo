//: [Previous](@previous)

import Foundation

// 两个数组的交集 II 哈希表
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    // 一个存hashMap
    // 一个遍历
    var hashMap : Dictionary<String, Int> = [:];
    var result : [Int] = [Int]();
    // 存储到哈希表中
    nums1.map { value in
        if (hashMap[String(value)] == nil ) {
            hashMap[String(value)] = 1
        } else if (hashMap[String(value)] != nil) {
            hashMap[String(value)] = hashMap[String(value)]! + 1
        }
    }
    nums2.map { value in
        if (hashMap[String(value)] != nil && hashMap[String(value)] != 0 ) {
            result.append(value)
            hashMap[String(value)] = hashMap[String(value)]! - 1
        }
    }
    return result;
}


print("\n===============")
var intersectNums1 = [4,9,5];
var intersectNums2 = [9,4,9,8,4];
print("ArrayDemo.intersect(nums) \(intersect(intersectNums1, intersectNums2))")




