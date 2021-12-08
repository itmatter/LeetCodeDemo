//: [Previous](@previous)

import Foundation

// 存在重复元素
func containsDuplicate(_ nums: [Int]) -> Bool {
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
print("\n===============")
var cDuplicateNums = [1,2,3,1];
print("ArrayDemo.containsDuplicate(nums) \(containsDuplicate(cDuplicateNums))")

