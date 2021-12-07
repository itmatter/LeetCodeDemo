//: [Previous](@previous)

import Foundation

// 剑指 Offer 27. 二叉树的镜像
//    例如输入：
//         4
//       /   \
//      2     7
//     / \   / \
//    1   3 6   9
//
//    镜像输出：
//         4
//       /   \
//      7     2
//     / \   / \
//    9   6 3   1

// 输入：root = [4,2,7,1,3,6,9]
// 输出：[4,7,2,9,6,3,1]



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

// 创建节点 :
// [4,2,7,1,3,6,9]
let rootNode = TreeNode(4)

let subNode2 = TreeNode(2)
let subNode7 = TreeNode(7)
let subNode1 = TreeNode(1)
let subNode3 = TreeNode(3)
let subNode6 = TreeNode(6)
let subNode9 = TreeNode(9)

rootNode.left = subNode2
rootNode.right = subNode7

subNode2.left = subNode1
subNode2.right = subNode3

subNode7.left = subNode6
subNode7.right = subNode9


// 翻转一个树, 递归, 从底部开始思考
func mirrorTree(_ root: TreeNode?) -> TreeNode? {
    guard let node = root else {
        return nil
    }
    reS(node)
    // 遍历打印node查看结果
    printTree(node)
    return node
   
}

// 从底部开始一个一个翻转, 不断的递归.
func reS(_ root: TreeNode?) {
    guard let node = root else {
        return
    }
    let tempNode = node.left
    node.left = node.right
    node.right = tempNode
    reS(node.left)
    reS(node.right)
}

// 打印树结构
func printTree(_ root : TreeNode?) {
    if (root == nil) {
        return
    }
    // 队列
    var queue = [TreeNode]()
    queue.append(root!)
    var result = [Int]()
    
    while (!queue.isEmpty) {
        var size = queue.count
        while (size > 0) {
            // 出栈
            let node = queue[0]
            queue.remove(at: 0)
            size -= 1
            result.append(node.val)
            
            if (node.left != nil) {
                queue.append(node.left!)
            }
            
            if (node.right != nil) {
                queue.append(node.right!)
            }
            
        }
    }
    print(result)
}



// 输入：root = [4,2,7,1,3,6,9]
// 输出：[4,7,2,9,6,3,1]
mirrorTree(rootNode)



