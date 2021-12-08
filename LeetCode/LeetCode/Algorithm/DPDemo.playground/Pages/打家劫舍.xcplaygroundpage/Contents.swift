//: [Previous](@previous)

import Foundation

// 打家劫舍
// 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，
// 如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
// 给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。
//
// dp定义一个数组, 这个数据就下标表示, 偷到第i间房间的时候, 金额最大
// 对比一下爬楼梯
// 如果当前在阶梯n的位置, 它的前面一次操作,要么是上一个阶梯 dp(n-1) 然后加一步, 或者是dp(n-2)然后加两步,
//
// 分析最后一步
// dp[i] = dp[i-1] 要么是 dp[i] = dp[i-2] + nums[i]
//
// 递推公式
// dp[i] = max( dp[i-1] ,  dp[i-2] + nums[i])
func rob(_ nums: [Int]) -> Int {
    if (nums.count == 0) {
        return 0
    }
    if (nums.count == 1) {
        return nums[0]
    }
    
    let len = nums.count;

    var dp: [Int] = [Int](repeating: 0, count: len);
    var i = 2;
    var maxResult = 0;
    
    // 边界值处理
    dp[0] = nums[0];
    dp[1] = max( dp[0], nums[1])
    maxResult = max( dp[0], dp[1] )
    
    while (i < len ) {
        dp[i] = max( dp[i-1] ,  dp[i-2] + nums[i])
        maxResult = max(maxResult, dp[i])
        i += 1
    }
    
    return maxResult
}



let nums = [1,2,3,4]
print("rob : \(rob(nums))")

