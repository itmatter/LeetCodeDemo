//: [Previous](@previous)

import Foundation


// 爬楼梯
// 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
// 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
//注意：给定 n 是一个正整数。


func climbStairs(_ n: Int) -> Int {
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


print("climbStairs : \(climbStairs(2))")
