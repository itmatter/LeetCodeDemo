//: [Previous](@previous)

import Foundation


//MARK: - 有效的字母异位词
func isAnagram(_ s: String, _ t: String) -> Bool {
    var sHashTable: [Character: Int] = [Character: Int]();
    var sChars : [Character] = [Character]();
    // 用哈希表存一遍统计次数.
    for char in s {
        // 判断哈希表中有没有当前元素
        if (sHashTable[char] != nil) {
            sHashTable[char] = sHashTable[char]! + 1;
        } else {
            // 没有元素
            sHashTable[char] = 1;
            sChars.append(contentsOf: [char])
        }
    }
    
    var tHashTable: [Character: Int] = [Character: Int]();
    var tChars : [Character] = [Character]();
    // 用哈希表存一遍统计次数.
    for char in t {
        // 判断哈希表中有没有当前元素
        if (tHashTable[char] != nil) {
            tHashTable[char] = tHashTable[char]! + 1;
        } else {
            // 没有元素
            tHashTable[char] = 1;
            tChars.append(contentsOf: [char])
        }
    }
    
    if (sChars.count != tChars.count) {
        return false;
    } else {
        // 判断个数是否相同
        for char in sChars {
            if (sHashTable[char] != tHashTable[char] ) {
                return false;
            }
        }
        return true;
    }
}

print("有效的字母异位词========================================")
print("isAnagram : \(isAnagram( "anagram", "nagaram" ))")

