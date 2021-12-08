import Cocoa

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


// DLR--前序遍历（根在前，从左往右，一棵树的根永远在左子树前面，左子树又永远在右子树前面 ）
// 1->2->4->5->3->6->7
func DLR(_ root: TreeNode?) -> [Int] {
    var list = [Int]()
    DLR_Recursion(root, &list)
    return list;
}

func DLR_Recursion(_ root: TreeNode?, _ list : inout [Int]) {
    if (root == nil) {
        return;
    }
    list.append(root!.val)
    DLR_Recursion(root!.left, &list)
    DLR_Recursion(root!.right, &list)
}


let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)
let treeNode1   = TreeNode(1, treeNode2, treeNode3)
let rootNode = treeNode1

print("DLR(rootNode) : \(DLR(rootNode))")
