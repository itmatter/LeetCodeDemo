//: [Previous](@previous)

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

// 二叉树的最大深度 (队列, 深度优先)
// 思想:
//  先进后出的思想
//  一个记录节点的stack栈，
//  一个记录节点所在层数的level栈，
//      stack中每个节点在level中都会有一个对应的值，并且他们是同时出栈，同时入栈
func maxDepthDFS(_ root: TreeNode?) -> Int {
    if (root == nil) {
        return 0
    }
    var stack : [TreeNode] = [TreeNode]()
    var level : [Int] = [Int]()
    stack.append(root!)
    level.append(1)
    var maxLevel = 0
    
    // 栈不为空
    while (!stack.isEmpty) {
        // 同时出栈
        let element = stack.popLast()!
        // 出栈
        let tempL = level.popLast()!
        maxLevel = maxLevel > tempL ? maxLevel : tempL
        
        // 同时入栈
        if (element.left != nil) {
            stack.append(element.left!)
            level.append(tempL + 1)
        }
        
        if (element.right != nil) {
            stack.append(element.right!)
            level.append(tempL + 1)
        }
    }
    return maxLevel
}


let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)
let treeNode1   = TreeNode(1, treeNode2, treeNode3)
let rootNode = treeNode1

print("TreeDemo.maxDepthDFS(rootNode) : \(maxDepthDFS(rootNode))")
