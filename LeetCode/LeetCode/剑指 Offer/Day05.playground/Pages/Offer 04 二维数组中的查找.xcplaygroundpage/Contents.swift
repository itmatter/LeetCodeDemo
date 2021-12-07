//: [Previous](@previous)

import Foundation




/**
 适合做这种
 let matrix = [
     [  1,   4,   7, 11, 15],
     [  2,   5,   8, 12, 19],
     [  3,   6,   9, 16, 22],
     [10, 13, 14, 17, 24],
     [18, 21, 23, 26, 30]
 ]
 */
func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
    if (matrix.count == 0) {
        return false;
    }
    var column = 0
    var row = matrix[column].count - 1
    var result = false
    while (column < matrix.count && row >= 0) {
        if (target == matrix[column][row] ) {
            result = true
            break;
        } else if (target < matrix[column][row] ) {
            // 如果当前值小, 那就往上走
            row -= 1
        } else if (target > matrix[column][row] ) {
            column += 1
        } else {
            result = false;
            break;
        }
    }
    return result;
}

let matrix = [
    [1, 4, 7, 11,15],
    [2, 5, 8, 12,19],
    [3, 6, 9, 16,22],
    [10,13,14,17,24],
    [18,21,23,26,30]
]

print(findNumberIn2DArray(matrix, 20))



/**
 适合做这种
 let matrix = [
     [1,2,3,4,5,6,7,8,9],
     [11,12,13,14,15,16,17,18,19],
     [21,22,23,24,25,26,27,28,29],
     [31,32,33,34,35,36,37,38,39],
     [41,42,43,44,45,46,47,48,49],
 ]
 */
func findNumberIn2DArrayXXXX(_ matrix: [[Int]], _ target: Int) -> Bool {
    var result = false
    var i = 0
    var j = matrix.count - 1
    var column = 0
    var row = 0
    while (i<j) {
       column = i + (j - i) / 2
       if (target == matrix[column][0] ) {
           break;
       }
       if (column < j && target < matrix[column][0] ) {
           j = column - 1
           if ( ( j >= 0) && target >= matrix[j][0] && target < matrix[column][0] ) {
               column = column - 1
               break;
           }
       } else if (column > i && target > matrix[column][0] ) {
           i = column + 1
           if ( (i < matrix.count) && target >= matrix[column][0] && target < matrix[i][0] ) {
               break;
           }
       } else {
           if (target >= matrix[i][0] && target < matrix[j][0] ) {
               column = i
           } else {
               column = j
           }
           break;
       }
    }

    i = 0;
    j = matrix[column].count - 1
    while (i < j) {
       row = i + (j - i) / 2
       if (target == matrix[column][row] || target == matrix[column][i] || target == matrix[column][j]) {
           result = true
           break
       } else if (row < j && target < matrix[column][row]) {
           j = row - 1
       } else if (row > i && target > matrix[column][row]) {
           i = row + 1
       } else {
           result = false
           break
       }
                    
    }
    return result
}

let matrixXXX = [
    [1,2,3,4,5,6,7,8,9],
    [11,12,13,14,15,16,17,18,19],
    [21,22,23,24,25,26,27,28,29],
    [31,32,33,34,35,36,37,38,39],
    [41,42,43,44,45,46,47,48,49],
]

print(findNumberIn2DArrayXXXX(matrixXXX, 16))
