//: [Previous](@previous)

import Foundation




//MARK: - 字符串中的第一个唯一字符
func firstUniqChar(_ s: String) -> Int {
    var hashTable: [Character: Int] = [Character: Int]();
    var chars : [Character] = [Character]();
    // 用哈希表存一遍统计次数.
    for char in s {
        // 判断哈希表中有没有当前元素
        if (hashTable[char] != nil) {
            hashTable[char] = hashTable[char]! + 1;
        } else {
            // 没有元素
            hashTable[char] = 1;
            chars.append(contentsOf: [char])
        }
    }

    // 再次重新遍历一次字符串. 用哈希表查询, 如果有值为1的结果, 就是出现了一次的.
    var index = 0;
    for char in s {
        if hashTable[char] == 1 {
            return index;
        }
        index += 1;
    }
    return -1;
}

print("字符串中的第一个唯一字符 ========================================")
print("firstUniqChar : \(firstUniqChar( "abxxcbbbba" ))")

