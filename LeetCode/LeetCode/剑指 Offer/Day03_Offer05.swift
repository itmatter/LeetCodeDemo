//
//  Day02_Offer35.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/29.
//

import Foundation

//请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
// print(Offer05.replaceSpace("We are happy."))

class Offer05 {
    
    static func replaceSpace(_ s: String) -> String {
        var result = s
        result = result.replacingOccurrences(of: " ", with: "%20", options: .caseInsensitive, range: nil)//忽略大小写替换
        return result;
    }
}

