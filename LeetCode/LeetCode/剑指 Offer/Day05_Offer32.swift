//
//  File.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/12/4.
//

import Foundation




class Offer32 {
    // 剑指 Offer 32 - I. 从上到下打印二叉树
    static func levelOrder(_ root: TreeNode?) -> [Int] {
        if (root == nil ) {
            return []
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
        return result
    }
    
    
    // 剑指 Offer 32 - II. 从上到下打印二叉树 II
    // 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。
    static func levelOrder2(_ root: TreeNode?) -> [[Int]] {
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
}
