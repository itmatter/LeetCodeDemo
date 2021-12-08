import Foundation



// 原地删除数组中的重复项, 给一个有序数组
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if (nums.count == 0) {
        return 0;
    }
    var tar = nums[0];
    var len = 1;
    // 1  1  2
    for n in nums {
        if ( tar != n ) {
            tar = n;
            len += 1
            nums[len - 1] = n;
        }
    }
    print("整理后的数组, \(nums)")
    return len;
}
print("\n===============")
var duplicatesArr = [1,1,2,2,3,3,3,4,5,6];
print("ArrayDemo.removeDuplicates(nums) \(removeDuplicates(&duplicatesArr))")


















