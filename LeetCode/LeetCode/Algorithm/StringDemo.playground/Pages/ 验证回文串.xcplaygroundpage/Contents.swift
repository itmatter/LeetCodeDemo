//: [Previous](@previous)

import Foundation



//MARK: - 验证回文串
func isPalindrome(_ s: String) -> Bool {
    // 只考虑字母和数字
    var chars : [String] = [String]() ;
    for char in s {
        let c = String(char).lowercased();
        if ( (c >= "a" && c <= "z") || (c >= "A" && c <= "Z") || (c >= "0" && c <= "9")  ) {
            chars.append(contentsOf: [c])
        }
    }
    
    var left = 0;
    var right = chars.count - 1;
    
    while (left < right) {
        if (chars[left] != chars[right]) {
            return false;
        }
        right -= 1;
        left += 1;
    }
    
    return true;
}


// 验证回文串
print("验证回文串========================================")
print("isPalindrome : \(isPalindrome("0P"))")


