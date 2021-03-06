//: [Previous](@previous)

import Foundation



// 数组中重复的数字
func findRepeatNumber(_ nums: [Int]) -> Int {
    if (nums.count == 0 ) {
        return 0
    }
    // 哈希表
    var hashTable = [String:Int]()
    var index = 0
    while (index < nums.count) {
        if (hashTable[String(nums[index])] != nil) {
            break;
        } else {
            hashTable[String(nums[index])] = nums[index];
        }
        index += 1
    }
    return nums[index]
}

func findAllRepeatNumber(_ nums: [Int]) -> Int {
    // 哈希表
    var hashTable = [String:Int]()
    var results = [Int]()
    nums.map{ value in
        if (hashTable[String(value)] != nil) {
            if (hashTable[String(value)] == 1) {
                results.append(value)
            }
            hashTable[String(value)] = hashTable[String(value)]! + 1
        } else {
            hashTable[String(value)] = 1;
        }
    }

    print(results)
    return results.count == 0 ? 0 : results[0]
}

print(findRepeatNumber([1,1,2,2,3,3,4,4,0,5,5,6,7,9]))
