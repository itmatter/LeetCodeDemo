import UIKit

//输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。

//输入: "the sky is blue"
//输出: "blue is sky the"

//输入: "  hello world!  "
//输出: "world! hello"
//解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。

//输入: "a good   example"
//输出: "example good a"
//解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。



func reverseWords(_ s: String) -> String {
    var chars = s.map{$0}

    // 先把前后的空格都去掉
    var start = 0
    while (start < chars.count) {
        if (chars[start] == " " ) {
            // 移除空格
            chars.remove(at: start)
            start = 0
        } else {
            break;
        }
    }
    var end = chars.count - 1
    while (end >= 0) {
        if (chars[end] == " " ) {
            // 移除空格
            chars.remove(at: end)
            end = chars.count - 1
        } else {
            break;
        }
    }

    if (chars.count == 0) {
        return ""
    }

    // 双指针
    var i = chars.count - 1
    var j = chars.count - 1
    
    var result = [String]()
    var hasSpace = false

    while (i > 0) {
        if (chars[i] == " " && chars[j] != " ") {
            result.append(  String(chars[(i+1)...j])  );
            result.append(  String(chars[i])  );
            j = i
            j -= 1
            hasSpace = true
        } else if (chars[i] == " " && chars[j] == " ") {
            j -= 1
            hasSpace = true
        }
        i -= 1
    }

    if (hasSpace) {
        // 最后加一次
        result.append(  String(chars[i...j])  );
    } else {
        result.append(  String(chars[0..<chars.count])  );
    }
    
    var str = ""
    result.map{ str.append($0)}
    return str;
}

print(reverseWords(""))
print(reverseWords(" "))
print(reverseWords("123"))
print(reverseWords("     123"))
print(reverseWords("     123            456  789    "))
print(reverseWords("     123            456  789"))
print(reverseWords("123            456  789    "))
print(reverseWords("123            456  789"))
