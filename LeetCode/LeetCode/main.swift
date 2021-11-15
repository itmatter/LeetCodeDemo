//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation

func getStringIndex(_ s : String, index: Int) -> Character{
    return s[s.index(s.startIndex, offsetBy: index)];
}

func subStr(_ s : String, startIndex: Int, endIndex: Int) -> String {
    let startI = s.index(s.startIndex, offsetBy: startIndex);
    let endI = s.index(s.startIndex, offsetBy: endIndex)
    let result = s[startI...endI];
    return String(result);
}



let s = "hello world"
print(subStr(s, startIndex: 2 ,endIndex:  4));

//// strStr()
//print("strStr()========================================")
//let s = Reverse();
//print("s.strStr : \(s.strStr("", "") ) " )




//// strStr()
//print("strStr()========================================")
//let s = Reverse();
//print("s.strStr : \(s.strStr("", "") ) " )





//"mississippi"
//"issip"

//
//// 字符串转换整数 (atoi)
//print("字符串转换整数 (atoi)========================================")
//let s = Reverse();
//print("s.isAnagram : \(s.myAtoi("12  34"))")

// 验证回文串
//print("验证回文串========================================")
//let s = Reverse();
//print("s.isAnagram : \(s.isPalindrome("0P"))")



// 有效的字母异位词
//print("有效的字母异位词========================================")
//let s = Reverse();
//print("s.isAnagram : \(s.isAnagram( "anagram", "nagaram" ))")




// 字符串中的第一个唯一字符
//print("字符串中的第一个唯一字符 ========================================")

//let s = Reverse();
//print("s.firstUniqChar : \(s.firstUniqChar( "abxxcbbbba" ))")






// 整数翻转
//print("整数翻转 ========================================")
//
//for index in 0...32 {
//    print("2 的\(index + 1)次幂 : \(2 << index) ")
//}
//let s = Reverse();
//print("s.reverseInteger : \(s.reverseInteger( 1534236469 ))")





// 翻转字符串
//print("翻转字符串 ========================================")
//var reversString: String = "abcdefg"
//var charsValue: [Character] = [];
//for v in reversString {
//    let ch = v as Character;
//    charsValue.append(ch);
//}
//
//let s = Reverse();
//s.reverseString(["a", "b", "c", "d", "e", "f", "g"])
//




