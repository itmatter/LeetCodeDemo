import UIKit
import Foundation

var greeting = "Hello, playground"

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/**
 给定的树 A：
         3
        / \
       4   5
      / \
     1   2
 
 
 给定的树 B：
    4
   /
  1
 */

let TreeARoot = TreeNode(3)
let TreeANode4 = TreeNode(4)
let TreeANode5 = TreeNode(5)
let TreeANode1 = TreeNode(1)
let TreeANode2 = TreeNode(2)

TreeARoot.left = TreeANode4
TreeARoot.right = TreeANode5

TreeANode4.left = TreeANode1
TreeANode4.right = TreeANode2

let TreeBRoot = TreeNode(4)
let TreeBNode1 = TreeNode(1)

TreeBRoot.left = TreeBNode1

print("TreeARoot : \(TreeARoot)")
print("TreeBRoot : \(TreeBRoot)")


func isRecur(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
    //B树节点不存在了，比较完成，没有出错
    if (B == nil) {
        return true
    }
    //A树节点不存在，而B树节点存在，匹配失败
    if (A == nil) {
        return false
    }
    // 值不相同,  返回false
    if (A!.val != B!.val) {
        return false
    }
    //同时存在且匹配成功，那么同时向左右儿子扩展比较
    return isRecur(A!.left, B!.left) && isRecur(A!.right, B!.right)
}



func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
    //题目已经说明，存在空树则不是子结构
    if (A == nil || B == nil) {
        return false
    }
    //这里三个函数都要调用，不能因为判断了某个节点值相等就只调用一个judge函数，而不调用扩展函数，这样会导致匹配失败一次即全盘判定失败
    return isRecur(A,B)||isSubStructure(A!.left,B)||isSubStructure(A!.right,B);
}


print(isSubStructure(TreeARoot, TreeBRoot))

