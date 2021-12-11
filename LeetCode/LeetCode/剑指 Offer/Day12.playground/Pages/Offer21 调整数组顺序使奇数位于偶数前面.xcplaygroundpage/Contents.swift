
import Foundation

// 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，
// 使得所有奇数在数组的前半部分，所有偶数在数组的后半部分。

//输入：nums = [1,2,3,4]
//输出：[1,3,2,4]
//注：[3,1,2,4] 也是正确的答案之一。


func exchange(_ nums: [Int]) -> [Int] {
    if (nums.count == 0 || nums.count == 1) {
        return nums
    }
    var i = 0 // 奇数
    var j = 1 //
    var result = nums
    while (j < nums.count) {
        if ( result[i] % 2 == 0  ) {
            if (result[j] % 2 == 1) {
                // 偶, 偶
                let temp = result[i]
                result[i] = result[j]
                result[j] = temp
                i += 1
                j += 1
            } else {
                // 偶, 奇
                j += 1
            }
        } else {
            // 奇, 偶
            // 奇, 奇
            i += 1
            j += 1
        }
    }
    return result
}


print(exchange([2,16,3,5,13,1,16,1,12,18,11,8,11,11,5,1]))


