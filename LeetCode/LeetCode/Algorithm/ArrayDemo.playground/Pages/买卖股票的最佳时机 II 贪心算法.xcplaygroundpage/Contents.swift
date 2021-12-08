//: [Previous](@previous)

import Foundation

// 买卖股票的最佳时机 II 贪心算法
func maxProfit(_ prices: [Int]) -> Int {
    if (prices.count < 1) {
        return 0;
    }
    var pre = 0;
    var max = 0;
    while ( pre + 1 < prices.count) {
        let diff = (prices[pre + 1]) - prices[pre];
        if (diff > 0) {
            max += diff
        }
        pre += 1;
    }
    return max;
}
print("\n===============")
var prices = [1,2,3,4,5];
print("ArrayDemo.maxProfit(nums) \(maxProfit(prices))")



