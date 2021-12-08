import Foundation

//MARK: - 实现strStr()
func strStr(_ haystack: String, _ needle: String) -> Int {
    if (needle == "") {
        return 0;
    }
    if (haystack.count < needle.count) {
        return -1;
    }
    if (haystack.count == needle.count) {
        return haystack == needle ? 0 : -1;
    }
    // 先转为字符数组
    let haystackChars = haystack.map{$0};
    let needleChars = needle.map{$0};
    // 双指针
    var hayIndex = 0;
    var needleIndex = 0;
    // 结束条件,
    while ( hayIndex < haystack.count && needleIndex < needle.count ) {
        if (haystackChars[hayIndex] == needleChars[needleIndex]) {
            // 如果相同
            needleIndex += 1;
            hayIndex += 1;
        } else {
            // 如果不同, 回退到前面
            hayIndex = hayIndex - needleIndex + 1;
            needleIndex = 0;
        }
    }
   
    // 走完了
    if (needleIndex == needle.count) {
        // 如果匹配到了
        return hayIndex - needleIndex;
    } else {
        // 如果没有匹配到
        return -1;
    }
}

// strStr()
print("strStr()========================================")
print("s.strStr : \(strStr("", "") ) " )

// strStr()
print("strStr()========================================")
print("s.strStr : \(strStr("", "") ) " )






















