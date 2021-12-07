//: [Previous](@previous)

import Foundation


//输入: [7,1,5,3,6,4]
//输出: 5
//解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
//

func maxProfit(_ prices: [Int]) -> Int {
    // 买卖股票的最佳时机
    // 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
    // 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
    // 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
    
    // 题目分析, 这里求的是最大的利润, 最大的利润是maxResult
    // dp是什么, dp是最优解,应该是叠加的利润, 从买卖的角度来看, 从开始到结束, dp有可能是大的利润
    
    // 所以, 确定边值
    if (prices.count == 0 || prices.count == 1) {
        return 0
    }
    
    // dp是什么, dp是叠加的利润, 叠加的利润和最大的利润不一样的概念
    var dp = prices[1] - prices[0]
    
    // 确定最后一步
    // 最后一步看前后一天股价是否还能涨 prices[i] - prices[i - 1] > 0
    // dp = prices[i] - prices[i - 1] > 0 ? dp + prices[i] - prices[i - 1] : prices[i]
    // 也就是
    var i = 1
    var maxResult = dp;   // 最大的利润

    while (i < prices.count) {
        let dif = prices[i] - prices[i - 1]
        dp = max(dp, 0) +  dif
        maxResult = max(dp, maxResult)
        i += 1
    }
    
    return maxResult
}

print(maxProfit([7,1,5,3,6,4]))
