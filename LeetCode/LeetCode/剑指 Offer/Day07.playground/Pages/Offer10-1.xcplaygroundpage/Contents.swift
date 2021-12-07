//: [Previous](@previous)

import Foundation

// 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项（即 F(N)）。斐波那契数列的定义如下：
//
//F(0) = 0,   F(1) = 1
//F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
//
//F(0) = 0,
//F(1) = 1
//F(2) = F(1) + F(0) = 1,
//F(3) = F(2) + F(1) = 2,
//F(4) = F(3) + F(2) = 3,
//F(5) = F(4) + F(3) = 5,
//
//斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。
//
//答案需要取模 1e9+7（1000 0000 07），如计算初始结果为：10 00 00 00 08，请返回 1。
//
//输入：n = 2
//输出：1
//
//输入：n = 5
//输出：5


// 动态规划, 保存前一次的结果
func fib(_ n: Int) -> Int {
    // 确定了边值
    if (n == 0) {
        return 0
    }
    if (n == 1) {
        return 1
    }
    
    var dp = [Int](repeating: 0, count: n)
    dp[0] = 0
    dp[1] = 1
    culDp(n-1, &dp)
    
    // 确定了状态转移方程
    return (dp[n-1] + dp[n-2]) % (Int(truncating: pow(10, 9) as NSNumber) + 7)
}

// 计算保存所有的结果
func culDp(_ n : Int ,_ dp : inout [Int]) {
    var index = 2
    while(index <= n) {
        dp[index] = dp[index - 1] + dp[index - 2]
        index += 1
    }
}
// 134903163
// 1134903170

//答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
let n = 5
print(fib(n))



