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
    
    
    // 从上到下打印二叉树 III
    // 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，
    // 第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。
    /**
         1
        /    \
       2       3
      /  \       /  \
     4   5      6   7
     */
    // [[1] , [3,2], [4,5,6,7]]
    static func levelOrder3(_ root: TreeNode?) -> [[Int]] {
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
}
