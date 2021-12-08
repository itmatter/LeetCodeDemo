
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


// 二叉树的层序遍历
// 广度优先的方法 (先进先出)
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if (root == nil) {
        return []
    }
    
    var queue : [TreeNode] = [TreeNode]()
    queue.append(root!)
    var result : [[Int]] = [[Int]]();
    
    while (!queue.isEmpty) {
        var size = queue.count
        var list : [Int] = [Int]()
        while (size > 0) {
            // 元素出列
            let node = queue.first
            queue.remove(at: 0)
            list.append(node!.val)
            
            if (node!.left != nil) {
                queue.append(node!.left!);
            }
            
            if (node!.right != nil) {
                queue.append(node!.right!);
            }
            size -= 1
        }
        result.append(list)
    }
    
    return result
};



let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)
let treeNode1   = TreeNode(1, treeNode2, treeNode3)
let rootNode = treeNode1

print("isSymmetric(rootNode) : \(levelOrder(rootNode))")
