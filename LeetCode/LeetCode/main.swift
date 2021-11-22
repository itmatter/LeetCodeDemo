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


let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)

let treeNode1   = TreeNode(1, treeNode2, treeNode3)

let rootNode = treeNode1

//print("TreeDemo.isValidBST(rootNode) : \(TreeDemo.isValidBST(rootNode))")


print("TreeDemo.DLR(rootNode) : \(TreeDemo.DLR(rootNode))")
print("=========================")
print("TreeDemo.LDR(rootNode) : \(TreeDemo.LDR(rootNode))")
print("=========================")
print("TreeDemo.LRD(rootNode) : \(TreeDemo.LRD(rootNode))")


//print("TreeDemo.maxDepth(rootNode) : \(TreeDemo.maxDepth(rootNode))")
//print("TreeDemo.maxDepthBFS(rootNode) : \(TreeDemo.maxDepthBFS(rootNode))")
//print("TreeDemo.maxDepthDFS(rootNode) : \(TreeDemo.maxDepthDFS(rootNode))")

