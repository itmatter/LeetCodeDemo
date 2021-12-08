
import Foundation

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// 验证二叉搜索树 (中序遍历)
//  给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。
//  有效 二叉搜索树定义如下：
//      节点的左子树只包含 小于 当前节点的数。
//      节点的右子树只包含 大于 当前节点的数。
//      所有左子树和右子树自身必须也是二叉搜索树。
//
//  中序遍历的思想 LDR
func isValidBST(_ root: TreeNode?) -> Bool {
    var list = [Int]()
    var isValid = true
    if (root == nil) {
        return false
    }
    // 中序遍历思想 , 左 根 右
    LDRCheck(root, &list, &isValid)
    return isValid
}

func LDRCheck(_ root: TreeNode? , _ list : inout [Int], _ isValid: inout Bool) {
    if (root == nil || !isValid) {
        return;
    }
    LDRCheck(root?.left, &list, &isValid);
    if (list.last != nil && root!.val <= list.last!) {
        isValid = false
    }
    list.append(root!.val)
    LDRCheck(root?.right, &list, &isValid);
}




let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)
let treeNode1   = TreeNode(1, treeNode2, treeNode3)
let rootNode = treeNode1
//

print("isValidBST(rootNode) : \(isValidBST(rootNode))")
