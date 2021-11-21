//
//  TreeDemo.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/21.
//

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
    
    
}
