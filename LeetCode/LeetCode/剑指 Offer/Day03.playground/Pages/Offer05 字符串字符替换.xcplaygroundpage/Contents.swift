//: [Previous](@previous)

import Foundation

func replaceSpace(_ s: String) -> String {
    var result = s
    result = result.replacingOccurrences(of: " ", with: "%20", options: .caseInsensitive, range: nil)//忽略大小写替换
    return result;
}

print(replaceSpace("We are happy."))
