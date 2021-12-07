//: [Previous](@previous)

import Foundation

public class TreeNode {
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


// 剑指 Offer 32 - II. 从上到下打印二叉树 II
// 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。
//例如:
//给定二叉树: [3,9,20,null,null,15,7],
//           3
//          / \
//         9  20
//           /  \
//          15   7

//返回其层次遍历结果：
//[
//  [3],
//  [9,20],
//  [15,7]
//]
func levelOrder2(_ root: TreeNode?) -> [[Int]] {
    if (root == nil ) {
        return []
    }
    // 队列
    var queue = [TreeNode]()
    queue.append(root!)
    var result = [[Int]]()
    
    while (!queue.isEmpty) {
        var size = queue.count
        var vals = [Int]()
        while (size > 0) {
            // 出栈
            let node = queue[0]
            queue.remove(at: 0)
            size -= 1
            vals.append(node.val)
            
            if (node.left != nil) {
                queue.append(node.left!)
            }
            
            if (node.right != nil) {
                queue.append(node.right!)
            }
            
        }
        result.append(vals)
        
    }
    return result
}

let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)

let treeNode1   = TreeNode(1, treeNode2, treeNode3)

print(levelOrder2(treeNode1))
