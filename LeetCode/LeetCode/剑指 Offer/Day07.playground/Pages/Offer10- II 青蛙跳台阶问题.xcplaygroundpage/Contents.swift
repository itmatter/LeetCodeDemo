import Foundation



//一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。
//
//答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。


func numWays(_ n: Int) -> Int {
    // 确定边值
    if (n == 0) {
        return 0
    }
    if (n == 1) {
        return 1
    }
    if (n == 2) {
        return 2
    }
    var dp = [Int](repeating: 0, count: n + 1)
    dp[0] = 0
    dp[1] = 1
    dp[2] = 2
    culDp(n, &dp)
    //答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
    return dp[n]
}

// 计算保存所有的结果
func culDp(_ n : Int ,_ dp : inout [Int]) {
    var index = 3
    let con = (Int(truncating: pow(10, 9) as NSNumber) + 7)
    while(index <= n) {
        dp[index] = ( (dp[index - 1]  &+ dp[index - 2]) % con)
        index += 1
    }
}

print(numWays(7))
