//: [Previous](@previous)

import Foundation

// 旋转数组
func reserve(_ nums:inout [Int], left: Int, right: Int) {
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

func rotate(_ nums: inout [Int], _ k: Int) {
    var index = k ;
    if ( index > nums.count ) {
        index = index % nums.count
    }
    // 旋转数组
    reserve(&nums, left: 0, right: nums.count - 1);
    reserve(&nums, left: 0, right: index - 1);
    reserve(&nums, left: index, right: nums.count - 1);
    print(nums);
}

print("\n===============")
var rotateNums = [1,2,3,4,5,6,7,8,9,10,11,12,13];
print("ArrayDemo.rotate(nums)")
rotate(&rotateNums, 5)

