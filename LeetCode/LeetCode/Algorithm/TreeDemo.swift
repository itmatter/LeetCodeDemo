//
//  TreeDemo.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/21.
//

import Foundation



/*
     3
    / \
    9  20
      /  \
     15   7
    /  \
    5   6
   /  \
   1   2
 */

//
//let treeNode7   = TreeNode(7, nil, nil)
//let treeNode6   = TreeNode(6, nil, nil)
//
//let treeNode5   = TreeNode(3, nil, nil)
//let treeNode4   = TreeNode(3, nil, nil)
//
//let treeNode3   = TreeNode(1, nil, treeNode5)
//let treeNode2   = TreeNode(1, treeNode4, nil)


//let treeNode3   = TreeNode(3, nil, nil)
//let treeNode2   = TreeNode(3, nil, nil)
//
//let treeNode1   = TreeNode(2, treeNode2, treeNode3)
//
//let rootNode = treeNode1
//
//
//
//print("TreeDemo.isSymmetric(rootNode) : \(TreeDemo.levelOrder(rootNode))")
//


//print("TreeDemo.isValidBST(rootNode) : \(TreeDemo.isValidBST(rootNode))")

//print("TreeDemo.DLR(rootNode) : \(TreeDemo.DLR(rootNode))")
//print("=========================")
//print("TreeDemo.LDR(rootNode) : \(TreeDemo.LDR(rootNode))")
//print("=========================")
//print("TreeDemo.LRD(rootNode) : \(TreeDemo.LRD(rootNode))")


//print("TreeDemo.maxDepth(rootNode) : \(TreeDemo.maxDepth(rootNode))")
//print("TreeDemo.maxDepthBFS(rootNode) : \(TreeDemo.maxDepthBFS(rootNode))")
//print("TreeDemo.maxDepthDFS(rootNode) : \(TreeDemo.maxDepthDFS(rootNode))")




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

class TreeDemo {
    
    static func logListList(_ head: ListNode?) {
        var headN = head;
        while (headN != nil) {
            print("\(headN!.val)")
            headN = headN!.next
        }
    }
    
    
    // 二叉树的最大深度 (递归)
    static func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1 ;
    }
    
    // 二叉树的最大深度 (队列, 广度优先)
    // 思想:
    //  先进先出的思想
    //  将节点放在队列中,这个队列要先进先出. 一层的节点为一次遍历
    //  相当于一层的数据进队列, 处理完一层的节点后, 这一层的下一层节点进入队列.
    //  直到这个队列为空
    static func maxDepthBFS(_ root: TreeNode?) -> Int {
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
    
    
    // 二叉树的最大深度 (队列, 深度优先)
    // 思想:
    //  先进后出的思想
    //  一个记录节点的stack栈，
    //  一个记录节点所在层数的level栈，
    //      stack中每个节点在level中都会有一个对应的值，并且他们是同时出栈，同时入栈
    static func maxDepthDFS(_ root: TreeNode?) -> Int {
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
    
 
    
    // 前序遍历 中序遍历 后序遍历
    //            1
    //         /      \
    //        2        3
    //       / \      / \
    //      4   5    6   7
    
    // DLR--前序遍历（根在前，从左往右，一棵树的根永远在左子树前面，左子树又永远在右子树前面 ）
    //          1->2->4->5->3->6->7
    static func DLR(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        TreeDemo.DLR_Recursion(root, &list)
        return list;
    }
    
    static func DLR_Recursion(_ root: TreeNode?, _ list : inout [Int]) {
        if (root == nil) {
            return;
        }
        list.append(root!.val)
        DLR_Recursion(root!.left, &list)
        DLR_Recursion(root!.right, &list)
    }
    
    
    // LDR--中序遍历（根在中，从左往右，一棵树的左子树永远在根前面，根永远在右子树前面）
    //          4->2->5->1->6->3->7
    static func LDR(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        TreeDemo.LDR_Recursion(root, &list)
        return list;
    }
    
    static func LDR_Recursion(_ root: TreeNode?, _ list : inout [Int]) {
        if (root == nil) {
            return;
        }
        LDR_Recursion(root!.left, &list)
        list.append(root!.val)
        LDR_Recursion(root!.right, &list)
    }
    
    
    
    // LRD--后序遍历（根在后，从左往右，一棵树的左子树永远在右子树前面，右子树永远在根前面）
    //          4->5->2->6->7->3->1
    static func LRD(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        TreeDemo.LRD_Recursion(root, &list)
        return list;
    }
    
    static func LRD_Recursion(_ root: TreeNode?, _ list : inout [Int]) {
        if (root == nil) {
            return;
        }
        LRD_Recursion(root!.left, &list)
        LRD_Recursion(root!.right, &list)
        list.append(root!.val)
    }
    
    
    // 总结, 需要存结果的递归, 就单独开一个函数.
    

    // 验证二叉搜索树 (中序遍历)
    //  给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。
    //  有效 二叉搜索树定义如下：
    //      节点的左子树只包含 小于 当前节点的数。
    //      节点的右子树只包含 大于 当前节点的数。
    //      所有左子树和右子树自身必须也是二叉搜索树。
    //
    //  中序遍历的思想 LDR
    static func isValidBST(_ root: TreeNode?) -> Bool {
        var list = [Int]()
        var isValid = true
        if (root == nil) {
            return false
        }
        // 中序遍历思想 , 左 根 右
        LDRCheck(root, &list, &isValid)
        return isValid
    }
    
    static func LDRCheck(_ root: TreeNode? , _ list : inout [Int], _ isValid: inout Bool) {
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
    
    // 二叉树的层序遍历
    // 广度优先的方法 (先进先出)
    static func levelOrder(_ root: TreeNode?) -> [[Int]] {
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
    
    
    
}