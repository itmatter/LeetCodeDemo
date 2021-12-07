//
//  DPDemo.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/25.
//

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


//
//let nums = [1,2,3,4]
//print("DPDemo.rob : \(DPDemo.rob(nums))")

//print(Date.init(timeIntervalSinceNow: 0))
//let prices = [1,2,-1,2]
//print("DPDemo.maxProfit : \(DPDemo.maxSubArray(prices))")
//print(Date.init(timeIntervalSinceNow: 0))

//print(Date.init(timeIntervalSinceNow: 0))
////let prices = [7,1,5,3,6,4]
//let prices = [1,3,2,5]
//print("DPDemo.maxProfit : \(DPDemo.maxProfit(prices))")
//print(Date.init(timeIntervalSinceNow: 0))

//print("DPDemo.climbStairs : \(DPDemo.climbStairs(5))")



class DPDemo {
    
    // 爬楼梯
    // 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
    // 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
    //注意：给定 n 是一个正整数。
    
    
   static func climbStairs(_ n: Int) -> Int {
       if (n == 0) {
           return 0;
       }
       
       if (n == 1) {
           return 1;
       }
       
       // 确定状态, dp[n] 就是最优解 , 对于问题, 有多少个变量就开多少个数组
       var dp : [Int] = [Int](repeating: 0, count: n)
       // 每次你可以爬 1 或 2 个台阶,
       //
       // 分析题目 最后一步dp(n)
       // 如果当前在阶梯n的位置, 它的前面一次操作,要么是上一个阶梯 dp(n-1) 然后加一步, 或者是dp(n-2)然后加两步,
       // 这个时候只需要关心如果是 dp(n-1), 它有多少中走法,  如果是dp(n-2) 它有多少中走法.
       // 因为最终的可能面对的情况, 无非就是dp(n-1)+1 或者是dp(n-2)+2
       // 所以递推方程式 : dp(n) = dp(n-1) + dp(n-2)种走法
       // 举个边界值, dp(3) = dp(2) + d(1) = ( 1,1   2) + (1) = 1,1,1  1,2  2,1 = 3中走法
       // dp[n] = dp[n-1]+dp[n-2];
       
       dp[0] = 1
       dp[1] = 2
       var i = 2;
       while(i < n) {
           dp[i] = dp[i-1]+dp[i-2]
           i += 1;
       }
       return dp[n - 1]
    }
    
    
    // 买卖股票的最佳时机
    // 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
    // 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
    // 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
    
    // 题目分析, 这里求的是最大的利润, 最大的利润是maxResult
    // dp是什么, dp是最优解,应该是叠加的利润, 从买卖的角度来看, 从开始到结束, dp有可能是大的利润
    static func maxProfit(_ prices: [Int]) -> Int {
        if (prices.count < 2 ){
            return 0
        }

        var dp : Int = prices[1]-prices[0]; // 叠加的利润
        var maxResult = max(dp, 0);   // 最大的利润
        var i = 2;
        print(prices)
        while (i < prices.count) {
            let dif = prices[i] - prices[i-1];
            dp = max(dp, 0) +  dif
            maxResult = max(dp, maxResult)
            i += 1;
        }
       
        return maxResult;
    }
    
    
    
    // 最大子序和
    // 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
    static func maxSubArray(_ nums: [Int]) -> Int {
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
    static func rob(_ nums: [Int]) -> Int {
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

}
