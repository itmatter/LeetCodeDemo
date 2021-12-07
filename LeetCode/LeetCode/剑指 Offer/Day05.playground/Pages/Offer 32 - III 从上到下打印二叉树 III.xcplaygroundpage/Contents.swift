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
//  [20,9],
//  [15,7]
//]

func levelOrder3(_ root: TreeNode?) -> [[Int]] {
    if (root == nil ) {
        return []
    }
    var queue = [TreeNode]()
    queue.append(root!)
    var result = [[Int]]()
    var leftToRight = false
    
    while (!queue.isEmpty) {
        var size = queue.count
        var vals = [Int]()
        leftToRight = !leftToRight
        while (size > 0) {
            if ( leftToRight ) {
                let node = queue.popLast()!
                size -= 1
                vals.append(node.val)
                
                if (node.left != nil) {
                    queue.insert(contentsOf: [node.left!], at: 0)
                }
                
                if (node.right != nil) {
                    queue.insert(contentsOf: [node.right!], at: 0)
                }
               
            } else {
       
                let node = queue[0]
                queue.remove(at: 0)
                size -= 1
                vals.append(node.val)
                
                if (node.right != nil) {
                    queue.append(node.right!)
                }
                if (node.left != nil) {
                    queue.append(node.left!)
                }
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

print(levelOrder3(treeNode1))
