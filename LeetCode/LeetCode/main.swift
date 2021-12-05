//
//  main.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/14.
//

import Foundation


let treeNode7   = TreeNode(7, nil, nil)
let treeNode6   = TreeNode(6, nil, nil)

let treeNode5   = TreeNode(5, nil, nil)
let treeNode4   = TreeNode(4, nil, nil)

let treeNode3   = TreeNode(3, treeNode6, treeNode7)
let treeNode2   = TreeNode(2, treeNode4, treeNode5)

let treeNode1   = TreeNode(1, treeNode2, treeNode3)



//print(Offer32.levelOrder(treeNode1))
//print(Offer32.levelOrder2(treeNode1))
print(Offer32.levelOrder3(treeNode1))

