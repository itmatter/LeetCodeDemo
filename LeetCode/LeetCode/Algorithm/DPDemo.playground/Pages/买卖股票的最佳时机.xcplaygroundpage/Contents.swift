//: [Previous](@previous)

import Foundation

// 买卖股票的最佳时机
// 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
// 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
// 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

// 题目分析, 这里求的是最大的利润, 最大的利润是maxResult
// dp是什么, dp是最优解,应该是叠加的利润, 从买卖的角度来看, 从开始到结束, dp有可能是大的利润
func maxProfit(_ prices: [Int]) -> Int {
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

print(Date.init(timeIntervalSinceNow: 0))
let prices = [7,1,5,3,6,4]
//let prices = [1,3,2,5]
print("maxProfit : \(maxProfit(prices))")
print(Date.init(timeIntervalSinceNow: 0))
