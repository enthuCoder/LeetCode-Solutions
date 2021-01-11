//
//  BinarySearchTree.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 11/23/20.
//

import Foundation

class BinarySearchTree<T: Comparable & CustomStringConvertible> {
    
    var root: TreeNode<T>?
    
    public init() {}

}

// MARK: Helper Functions
extension BinarySearchTree {
    
    func isLeaf(_ node: TreeNode<T>) -> Bool {
        return node.left == nil && node.right == nil
    }
}

// MARK: Construction of Binary Tree
extension BinarySearchTree {
    
    // Add a new Node in the Binary Search Tree
    func addNode(_ value: T) {
        let newNode = TreeNode(value)
        guard let rootNode = self.root else {
            self.root = newNode
            return
        }
        insert(newNode: newNode, withRoot: rootNode)
    }
    
    // Insert a Node in a Binary Search Tree
    func insert(newNode: TreeNode<T>, withRoot rootNode: TreeNode<T>) {
        // Move towards ------> LEFT Node
        if newNode.val <= rootNode.val {
            if rootNode.left == nil {
                rootNode.left = newNode
            } else {
                insert(newNode: newNode, withRoot: rootNode.left!)
            }
        }
        // Move towards ------> RIGHT Node
        else {
            if rootNode.right == nil {
                rootNode.right = newNode
            } else {
                insert(newNode: newNode, withRoot: rootNode.right!)
            }
        }
    }
}

// MARK: Searching a value
extension BinarySearchTree {
    public func search(_ value: T) -> TreeNode<T>? {
        return self.search(self.root, value)
    }
    
    // Do Post-Order traversal for Searching the value
    @discardableResult
    private func search(_ root: TreeNode<T>?, _ value: T) -> TreeNode<T>? {
        guard  let rootNode = root else {
            print("Node with value \(value) is not available")
            return nil
        }
        print("Current Root Node: \(rootNode.val)")
        if rootNode.val == value {
            print("Node value available: \(rootNode.val)")
            return root
        } else if rootNode.val < value {
            return search(rootNode.left, value)
        } else if rootNode.val > value {
            return search(rootNode.right, value)
        }
        return nil
    }
}

// MARK: Delete a Node
/*
 Steps:
 Case 1: Element to be deleted is a leaf node
        - Navigate to the node and delete it
 
 Case 2: Node that needs to be deleted has one child (Similar to how it is done for Linked List)
        - Child's connection is first made with the parent of the node to be deleted.
        - Delete the node to be deleted
 
 Case 3: Node to be deleted has 2 Children
        - Find:
            * Smallest value in the Right Subtree, or
            * Largest value in the Left Subtree (we may chose this when no right subtree is present)
        - Now swap the value of the above "Find" with the Node to be deleted
        - This would now have reduced to either Case 1 or Case 2.
 */
extension BinarySearchTree {
    func delete(_ value: T) {
        self.root = self.deleteRecursive(self.root, value)
    }
    
    func deleteRecursive(_ root: TreeNode<T>?, _ value: T) -> TreeNode<T>? {
        guard let rootNode = root else {
            return nil
        }
        if value > (rootNode.val) {
            rootNode.right = deleteRecursive(rootNode.right, value)
        } else if value < rootNode.val {
            rootNode.left = deleteRecursive(rootNode.left, value)
        } else {
            if rootNode.left == nil {
                return rootNode.right
            } else if rootNode.right == nil {
                return rootNode.left
            }
            
            
            
        }
        return root
    }
}


// MARK: Print a Binary Search Tree
extension BinarySearchTree {
    
    func printBinarySearchTree() -> String {
        guard let root = self.root else {
            return "Empty Binary Search Tree"
        }
        
        return printTree(root) { ($0.val, $0.left, $0.right) }
    }
    
    func printBinarySearchTree(withRoot root: TreeNode<T>?) -> String {
        guard let rootNode = root else {
            return "Empty Tree!!\n"
        }
        
        return printTree(rootNode) { ($0.val, $0.left, $0.right) }
    }

    // SOURCE: https://stackoverflow.com/questions/43898440/how-to-draw-a-binary-tree-in-console
    // TBD: To understand the code and see if it is generic
    func printTree<T>(_ node: TreeNode<T>, reversed: Bool = false, isTop: Bool = true, using nodeInfo: (TreeNode<T>) -> (T, TreeNode<T>?, TreeNode<T>?)) -> String {
        // node value and sub nodes
        let (val, leftNode, rightNode) = nodeInfo(node)
        
        let valueWidth = "\(val)".count
        
        // recurse to sub nodes to obtain line blocks on left and right
        let leftBlock = leftNode == nil ? [] : printTree(leftNode!, reversed: reversed, isTop: false, using: nodeInfo).components(separatedBy: "\n")
        
        let rightBlock = rightNode == nil ? [] : printTree(rightNode!, reversed: reversed, isTop: false, using: nodeInfo).components(separatedBy: "\n")

        // count common and maximum number of sub node lines
        let commonLines = min(leftBlock.count, rightBlock.count)
        let subLevelLines = max(leftBlock.count, rightBlock.count)
        
        // extend lines on shallower side to get same number of lines on both sides
        let leftSubLines      = leftBlock
                              + Array(repeating:"", count: subLevelLines-leftBlock.count)
        let rightSubLines     = rightBlock
                              + Array(repeating:"", count: subLevelLines-rightBlock.count)

        // compute location of value or link bar for all left and right sub nodes
        //   * left node's value ends at line's width
        //   * right node's value starts after initial spaces
        let leftLineWidths    = leftSubLines.map{$0.count}
        let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }

        // top line value locations, will be used to determine position of current node & link bars
        let firstLeftWidth    = leftLineWidths.first   ?? 0
        let firstRightIndent  = rightLineIndents.first ?? 0

        // width of sub node link under node value (i.e. with slashes if any)
        // aims to center link bars under the value if value is wide enough
        //
        // ValueLine:    v     vv    vvvvvv   vvvvv
        // LinkLine:    / \   /  \    /  \     / \
        //
        let linkSpacing       = min(valueWidth, 2 - valueWidth % 2)
        let leftLinkBar       = leftNode  == nil ? 0 : 1
        let rightLinkBar      = rightNode == nil ? 0 : 1
        let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
        let valueOffset       = (valueWidth - linkSpacing) / 2

        // find optimal position for right side top node
        //   * must allow room for link bars above and between left and right top nodes
        //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
        //   * can be offset to the left if lower subNodes of right node
        //     have no overlap with subNodes of left node
        let minSpacing        = 2
        let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
                                .reduce(firstLeftWidth + minLinkWidth)
                                { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }

        // extend basic link bars (slashes) with underlines to reach left and right
        // top nodes.
        //
        //        vvvvv
        //       __/ \__
        //      L       R
        //
        let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
        let rightLinkExtra    = linkExtraWidth / 2
        let leftLinkExtra     = linkExtraWidth - rightLinkExtra

        // build value line taking into account left indent and link bar extension (on left side)
        let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
        let valueLine         = String(repeating:" ", count:max(0,valueIndent))
                              + "\(val)"
        let slash             = reversed ? "\\" : "/"
        let backSlash         = reversed ? "/"  : "\\"
        let uLine             = reversed ? "¯"  : "_"
        // build left side of link line
        let leftLink          = leftNode == nil ? ""
                              : String(repeating: " ", count:firstLeftWidth)
                              + String(repeating: uLine, count:leftLinkExtra)
                              + slash

        // build right side of link line (includes blank spaces under top node value)
        let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
        let rightLink         = rightNode == nil ? ""
                              : String(repeating:  " ", count:rightLinkOffset)
                              + backSlash
                              + String(repeating:  uLine, count:rightLinkExtra)

        // full link line (will be empty if there are no sub nodes)
        let linkLine          = leftLink + rightLink

        // will need to offset left side lines if right side sub nodes extend beyond left margin
        // can happen if left subtree is shorter (in height) than right side subtree
        let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
        let leftIndent        = String(repeating:" ", count:leftIndentWidth)
        let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }

        // compute distance between left and right sublines based on their value position
        // can be negative if leading spaces need to be removed from right side
        let mergeOffsets      = indentedLeftLines
                                .map{$0.count}
                                .map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
                                .enumerated()
                                .map{ rightSubLines[$0].isEmpty ? 0  : $1 }

        // combine left and right lines using computed offsets
        //   * indented left sub lines
        //   * spaces between left and right lines
        //   * right sub line with extra leading blanks removed.
        let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
                                .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
                                .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }

        // Assemble final result combining
        //  * node value string
        //  * link line (if any)
        //  * merged lines from left and right sub trees (if any)
        let treeLines = [leftIndent + valueLine]
                      + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
                      + mergedSubLines

        return (reversed && isTop ? treeLines.reversed(): treeLines)
        .joined(separator:"\n")
    }
}
