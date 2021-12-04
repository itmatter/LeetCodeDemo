//
//  File.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/12/4.
//

import Foundation


// 剑指 Offer 32 - I. 从上到下打印二叉树


class Offer32 {
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
}
