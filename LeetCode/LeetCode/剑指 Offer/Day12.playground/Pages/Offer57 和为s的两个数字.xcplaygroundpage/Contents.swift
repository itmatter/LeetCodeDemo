
import Foundation

//输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

//输入：nums = [2,7,11,15], target = 9
//输出：[2,7] 或者 [7,2]
//
//输入：nums = [10,26,30,31,47,60], target = 40
//输出：[10,30] 或者 [30,10]

// 也就是两数之和


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashTable = [String: Int]()
    var i = 0
    var result = [Int]()
    while (i < nums.count) {
        let jValue = target - nums[i];
        if (hashTable[ String(jValue) ] != nil) {
            result.append(jValue)
            result.append(nums[i])
            print(result)
            break;
        } else {
            hashTable[ String(nums[i]) ] = nums[i]
        }
        i += 1
    }
    return result
}

print(twoSum([2,7,11,15], 9))
