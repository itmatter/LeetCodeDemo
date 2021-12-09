//: [Previous](@previous)

import Foundation


//MARK: - 字符串转换整数 (atoi)
func myAtoi(_ s: String) -> Int {
    let chars = s.map{ $0 }
    // 判断每个字节开头是否是空格
    var startIndex = -1;
    var endIndex = -1;
    
    var index = 0;
    for c in chars {
        // 如果遇到
        if (c == " " ) {
            if ( endIndex != -1 ) {
                break;
            }
        } else if ( c >= "0" && c <= "9") {
            // 0-9
            if ( startIndex == -1 ) {
                startIndex = index;
            }
            endIndex = index;
        } else if ( c == "-") {
            if ( endIndex != -1 ) {
                break;
            } else {
                if ( startIndex == -1 ) {
                    startIndex = index;
                }
                endIndex = index;
            }
            
        } else if ( c == "+") {
            if ( endIndex != -1 ) {
                break;
            } else {
                if ( startIndex == -1 ) {
                    startIndex = index;
                }
                endIndex = index;
            }
            
        } else {
            break;
        }
        index += 1;
    }
    
    if (endIndex != -1) {
        let resultStr = s[s.index(s.startIndex, offsetBy: startIndex)...s.index(s.startIndex, offsetBy: endIndex)]
        let res = (resultStr as NSString).longLongValue;
        // 翻转后, 最大32位, 不允许超过32位
        let maxNum = 1 << 31;
        print("maxNum : \(maxNum)")
        if (res > maxNum - 1 ) {
            return maxNum - 1;
        }
        if (res < -maxNum ){
            return -maxNum;
        }
        return Int(resultStr) ?? 0;
    } else {
        return 0;
    }

}

//// 字符串转换整数 (atoi)
print("字符串转换整数 (atoi)========================================")
print("myAtoi : \(myAtoi("12  34"))")

