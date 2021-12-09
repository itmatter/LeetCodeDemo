
import Foundation

//剑指 Offer 46. 把数字翻译成字符串


//给定一个数字，我们按照如下规则把它翻译为字符串：
// 0 翻译成 “a” ，
// 1 翻译成 “b”，……，
// 11 翻译成 “l”，……，
// 25 翻译成 “z”。
//
//一个数字可能有多个翻译。
// 请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

//输入: 12258
//输出: 5
//解释: 12258有5种不同的翻译，分别是
// 1-2-2-5-8    "bccfi",
// 1-22-5-8     "bwfi",
// 1-2-25-8     "bczi",
// 12-2-5-8     "mcfi"
// 12-25-8      "mzi"
//

// num > 0

func translateNum(_ num: Int) -> Int {
    // dp, 常量 ? 一维数组? 二维数组?
    // 考虑dp之前要考虑整体要从0到n的考虑, 还是要从n到0的顺序考虑, 这里考虑有多少种方法, 也就是最大是多少
    // 比如num长度为n, 最多有多少种. 可以类比爬楼梯, 最多有多少中, 理解为打家劫舍, 最多的利润是多少
    //
    // 所以dp是一维数组. n代表什么, 理解n
    // 比如 1-2-2-5-8 试着吧 num转成一个数组
    //
    // 其实思路就是爬楼梯, 只是跨2级的时候, 判断是不是>25
    // 回想爬楼梯的思路
    // 最后一步 dp[n] = dp[n-1] + dp[n-2]
    // 这里的抽象就是 dp[n] = dp[n-1] + (当前的阶梯 - 上一个阶梯 > 25 ? 0 : dp[n-2] )
    // 同时 num[0] 结合 num[1] 组成的值判断是否 > 25, 如果大于那就是不能翻译
    //
    // 也就是 num[0] * 10 + num[1] > 25 ? 0 : 1,
    // 也就是 dp[1] = 1 + (num[0] * 10 + num[1] > 25 ? 0 : 1)
    // 递推公式 d[i] = dp[i - 1] + (num[i - 1] * 10 + num[i] > 25 ? 0 : 1)
    
    //
    //  抽象, 比如 12258 , 也就是n = 5 , 假设 nums = [1,2,2,5,8]
    //  也就是 dp[n] = dp[n-1] + (nums[n] - nums[n-1] > 25 ? 0 : dp[n-2] )
    //
    //
    // 思考到最后一步:
    //  dp[n] = dp[n-1] + (nums[n] - nums[n-1] > 25 ? 0 : dp[n-2] )
    //
    
    var count = 0
    var val = num
    var numsArr = [Int]()
    while (val > 0) {
        count += 1
        numsArr.insert( val%10, at: 0)
        val /= 10
    }
    
    if (numsArr.count == 1 || num == 0) {
        return 1
    }
    

    var dp = [Int](repeating: 0, count: count)
    dp[0] = 1
    dp[1] = numsArr[1] + numsArr[0] * 10 > 25 ? 1 : 2

    var i = 2
    while (i < count) {
        print("numsArr[i-1] * 10 + numsArr[i] >>>>>>  \(numsArr[i-1] * 10 + numsArr[i])")
        let condition1 = ( numsArr[i-1] * 10 + numsArr[i] ) > 25
        let condition2 = ( numsArr[i-1] == 0 )// 0X的组合就没有意义了
        dp[i] = dp[i-1] + (condition1 || condition2 ? 0 : dp[i-2])
        i += 1
    }
    print(dp)
    return dp[count - 1]
}


print(translateNum(0))

// 1-0-0-1
// 10-0-1
// 1
