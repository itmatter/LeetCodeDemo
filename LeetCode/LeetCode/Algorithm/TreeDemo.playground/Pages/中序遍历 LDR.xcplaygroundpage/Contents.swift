
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

// LDR--中序遍历（根在中，从左往右，一棵树的左子树永远在根前面，根永远在右子树前面）
// 4->2->5->1->6->3->7
func LDR(_ root: TreeNode?) -> [Int] {
    var list = [Int]()
    LDR_Recursion(root, &list)
    return list;
}

func LDR_Recursion(_ root: TreeNode?, _ list : inout [Int]) {
    if (root == nil) {
        return;
    }
    LDR_Recursion(root!.left, &list)
    list.append(root!.val)
    LDR_Recursion(root!.right, &list)
}



let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)
let treeNode1   = TreeNode(1, treeNode2, treeNode3)
let rootNode = treeNode1

print("LDR(rootNode) : \(LDR(rootNode))")
