import Cocoa

//字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
// 原地翻转
//输入: s = "abcdefg", k = 2
//输出: "cdefgab"


// 原地翻转解法 , 三次翻转
func reverseLeftWords(_ s: String, _ n: Int) -> String {
    var k = n
    if (k > s.count) {
        k = s.count
    }
    
    var chars = s.map{ $0 }

    var index = 0
    // 第一次翻转, 翻转0..<n
    while(index < (k - index)) {
        let temp = chars[index];
        chars[index] = chars[k - index - 1]
        chars[k - index - 1] = temp
        
        index += 1
    }

    // 第二次翻转, 翻转n...s.count
    index = k
    while(index < chars.count - index + k) {
        let temp = chars[index];
        chars[index] = chars[chars.count - index - 1 + k]
        chars[chars.count - index - 1 + k] = temp
        index += 1
    }
    
    // 第三次翻转, 全部翻转
    index = 0
    while(index < (chars.count - index)) {
        let temp = chars[index];
        chars[index] = chars[chars.count - index - 1]
        chars[chars.count - index - 1] = temp
        index += 1
    }
    
    return String(chars)
}
    

print(reverseLeftWords("abcdefg",2))
