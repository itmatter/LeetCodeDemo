//: [Previous](@previous)

import Foundation

// 剑指 Offer 28. 对称的二叉树

// 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。
//
//    例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
//
//        1
//       / \
//      2   2
//     / \ / \
//    3  4 4  3
//    但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
//
//        1
//       / \
//      2   2
//       \   \
//       3    3


//输入：root = [1,2,2,3,4,4,3]
//输出：true
//
//
//输入：root = [1,2,2,null,3,null,3]
//输出：false


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

//示例1
let nodeB1 = TreeNode(1)
let nodeB2 = TreeNode(2)
let nodeB3 = TreeNode(2)
let nodeB4 = TreeNode(3)
let nodeB5 = TreeNode(3)

nodeB1.left = nodeB2
nodeB1.right = nodeB3

nodeB2.right = nodeB4
nodeB3.right = nodeB5


//示例2
let nodeA1 = TreeNode(1)
let nodeA2 = TreeNode(2)
let nodeA3 = TreeNode(2)
let nodeA4 = TreeNode(3)
let nodeA5 = TreeNode(4)
let nodeA6 = TreeNode(4)
let nodeA7 = TreeNode(3)
nodeA1.left = nodeA2
nodeA1.right = nodeA3
nodeA2.left = nodeA4
nodeA2.right = nodeA5
nodeA3.left = nodeA6
nodeA3.right = nodeA7



// 特殊处理 : 根节点为空 , 返回true
// 返回值 recur(左边的节点, 右边的节点)
func isSymmetric(_ root: TreeNode?) -> Bool {
    if (root == nil) {
        return true
    }
    
    return recur(root?.left, root?.right)
}

// 终止条件：
// 1. 当L和R 同时越过叶节点： 此树从顶至底的节点都对称，因此返回 true
// 2. 当L和R 只有一个越过叶子结点, 树不对称, 返回false
// 3. 当L和R的值不相等, 树不对称, 返回false

// 递推工作：
// 1. 判断两个节点L.left  和 R.right是否对称, 即 recur(L.left, R.right);
// 2. 判断两个节点L.right 和 R.left 是否对称, 即 recur(L.right, R.left);

// 返回值： 两对节点都对称时，才是对称树，因此用与逻辑符 && 连接。
func recur(_ L: TreeNode?, _ R: TreeNode?) -> Bool {
    // 1. 当L和R 同时越过叶节点： 此树从顶至底的节点都对称，因此返回 true
    if (L == nil && R == nil) {
        return true
    }
    // 2. 当L和R 只有一个越过叶子结点, 树不对称, 返回false
    if (L == nil || R == nil) {
        return false
    }
    // 3. 当L和R的值不相等, 树不对称, 返回false
    if ( L!.val != R!.val) {
        return false
    }
    return recur(L!.left, R!.right) && recur(L!.right, R!.left)
}


// 示例1
print(isSymmetric(nodeA1))
// 示例2
print(isSymmetric(nodeB1))

