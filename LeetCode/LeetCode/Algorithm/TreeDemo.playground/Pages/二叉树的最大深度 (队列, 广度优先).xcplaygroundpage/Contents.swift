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

// 二叉树的最大深度 (队列, 广度优先)
// 思想:
//  先进先出的思想
//  将节点放在队列中,这个队列要先进先出. 一层的节点为一次遍历
//  相当于一层的数据进队列, 处理完一层的节点后, 这一层的下一层节点进入队列.
//  直到这个队列为空
func maxDepthBFS(_ root: TreeNode?) -> Int {
    if (root == nil) {
        return 0;
    }
    var queue : [TreeNode] = [TreeNode]();
    var level = 0;
    
    queue.append(root!);
    // 判断条件, 队列不为空
    while (!queue.isEmpty) {
        // 判断条件, 出栈操作
        var size = queue.count
        if (size > 0) {
            level += 1;
        }
      
        while ( size > 0 ) {
            // 出栈
            let element = queue[0]
            queue.remove(at: 0)
            if (element.left != nil) {
                queue.append(element.left!);
            }
            
            if (element.right != nil) {
                queue.append(element.right!);
            }
            // 出栈的元素都放在了队列里面, 直到上一层的队列里面的元素个数size为0
            size -= 1;
        }
    }
    return level;
}


let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)
let treeNode1   = TreeNode(1, treeNode2, treeNode3)
let rootNode = treeNode1

print("maxDepthBFS(rootNode) : \(maxDepthBFS(rootNode))")
