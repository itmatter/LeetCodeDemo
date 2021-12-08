import Foundation

//动态规划使用规则
//
//确定状态
//确定状态转换方程
//确定边值(手工定义)
//计算顺序


//  确定状态需要两个意识
//      最后一步
//      子问题

// 最大子序和
// 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
func maxSubArray(_ nums: [Int]) -> Int {
    if (nums.count == 0) {
        return 0
    }
    
    // 首先思考, 设置dp, dp代表什么?
    // 最大和, 可以设定一个maxResult
    
    // 最后一步
    // 比较, 最后一步, 从最后一步考虑, 假设当前的dp是最优解, 也就是最大值, 那么下一个遇到的是nums[i]
    // 如果是dp的下一步是最优解, 也就是dp+nums[i]组成一个更大的和, 呢么dp = dp + nums[i];
    // 如果 dp + nums[i] 成为了一个更小的值, 也就是无论下一个nums[i+1]是多少, 也一定是nums[i+1] - nums[i] > 0
    //
    // dp = Max(nums[i], dp + nums[i])
    // dp中可能出现过累计最大的, 所以要用一个maxResult来记录
    var dp = nums[0]
    var i = 1
    let len = nums.count
    var maxResult = dp
    
    while (i < len) {
        dp = max(nums[i], dp + nums[i])
        print(dp)
        maxResult = max(dp, maxResult)
        i += 1
    }
    
    return maxResult;
}

print(Date.init(timeIntervalSinceNow: 0))
let prices = [1,2,-1,2]
print("maxProfit : \(maxSubArray(prices))")
print(Date.init(timeIntervalSinceNow: 0))
