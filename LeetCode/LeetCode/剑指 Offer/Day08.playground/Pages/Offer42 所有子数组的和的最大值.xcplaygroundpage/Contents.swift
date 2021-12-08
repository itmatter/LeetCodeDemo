import Foundation


//输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。
//
//要求时间复杂度为O(n)。

//输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
//输出: 6
//解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

// 这个题目也就是最大子序和
func maxSubArray(_ nums: [Int]) -> Int {
    if (nums.count == 0) {
        return 0
    }

    // 理解dp
    // 从0开始到nums.count - 1遍历.
    // dp[n]也就是当前的位置,可能出现的最大的和
    // 也可以不用一维数组
    // dp[n] 代表, 从n往前, 子数组可能出现的最大的值
    var dp = [Int].init(repeating: 0, count: nums.count )
    
    // 确定边值
    dp[0] = nums[0]
    var maxResult = dp[0]
    var i = 1
    print(nums)
    while (i < nums.count) {
        dp[i] = max(nums[i], dp[i-1] + nums[i])
        maxResult = max(dp[i], maxResult)
        i += 1
    }
    print(dp)
    return maxResult
}

var nums = [-2,1,-3,4,-1,2,1,-5,4]
//nums = [-2,-1]
print(maxSubArray(nums))
