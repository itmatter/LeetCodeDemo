import UIKit

//在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。
//你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。
//给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？


//输入:
//    [
//      [1,3,1],
//      [1,5,1],
//      [4,2,1]
//    ]
//输出: 12
//解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物



func maxValue(_ grid: [[Int]]) -> Int {
    //请计算你最多能拿到多少价值的礼物？
    
    let rowCount  = grid.count //列
    let columnCount = grid[0].count //行
    // 理解dp,二维数组, 表示i*j的位置最大的礼物价值.
    var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: columnCount), count: rowCount)

    // 确定边界条件
    
    var i = 0
    var j = 0
    
    // 你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。
    // 思考最后一步
    // dp[i][j] 的来源可能是    dp[i-1][j] + grid[i][j]
    // dp[i][j] 的来源也可能是  dp[i][j-1] + grid[i][j-1]
    // 那么
    // dp[i][j] = max(grid[i][j] + dp[i-1][j], grid[i][j] + dp[i][j-1])
    // 一直递归
    while( i < rowCount ) {
        while (j < columnCount ) {
            if (i == 0 && j == 0) {
                dp[i][j] = grid[i][j]
            } else if (i == 0) {
                dp[i][j] = grid[i][j] + dp[0][j - 1]
            } else if (j == 0) {
                dp[i][j] = grid[i][j] + dp[i-1][0]
            } else {
                dp[i][j] = max(grid[i][j] + dp[i-1][j], grid[i][j] + dp[i][j-1])
            }
            j += 1
        }
        j = 0
        i += 1
    }
    return dp[rowCount - 1][columnCount - 1];
}


var grid = [
            [1,3,1],
            [1,1,1],
            [4,2,1],
]

//[1,4,5],
//[2,5,6],
//[6,8,9],

grid=[[0]]

print(maxValue(grid))



