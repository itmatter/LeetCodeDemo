//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
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


let treeNode1   = TreeNode(1, nil, nil)
let treeNode2   = TreeNode(2, nil, nil)


let treeNode5   = TreeNode(5, treeNode1, treeNode2)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode15  = TreeNode(15, nil, nil)
let treeNode7   = TreeNode(7, nil, nil)

let treeNode20  = TreeNode(20, treeNode15, nil)
let treeNode9   = TreeNode(9, treeNode7, nil)

let treeNode3   = TreeNode(3, treeNode9, treeNode20)

let rootNode = treeNode3

//          3
//         / \
//        9  20
//       /   /
//      7   15


print("TreeDemo.maxDepth(rootNode) : \(TreeDemo.maxDepth(rootNode))")
print("TreeDemo.maxDepthBFS(rootNode) : \(TreeDemo.maxDepthBFS(rootNode))")
print("TreeDemo.maxDepthDFS(rootNode) : \(TreeDemo.maxDepthDFS(rootNode))")

