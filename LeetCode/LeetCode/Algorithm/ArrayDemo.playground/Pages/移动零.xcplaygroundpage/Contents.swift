//: [Previous](@previous)

import Foundation

// 移动零
func moveZeroes(_ nums: inout [Int]) {
    if (nums.count < 2) {
        return;
    }
    var start = 0;
    var end = 1;
    while (end < nums.count) {
        if ((nums[start] != 0 && nums[end] != 0) || (nums[start] != 0 && nums[end] == 0)) {
            start += 1;
        } else if ( nums[start] == 0 && nums[end] != 0) {
            let temp = nums[end]
            nums[end] = nums[start]
            nums[start] = temp
        }
        
        end += 1;

    }
    
    
}


print("\n===============")
var zeroesArr = [0,0,0,0,0,1];
moveZeroes(&zeroesArr)
print("ArrayDemo.moveZeroes(nums) \(zeroesArr)")

