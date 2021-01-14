//
//  200. Number of Islands.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 1/12/21.
//

import Foundation

/*
 200. Number of Islands
 
 Given an m x n 2d grid map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 Example 1:

 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 Example 2:

 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3
 */

class Input_200 {
    func executeInput() {
        let grid: [[Character]] = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ]
        print("\(numIslands(grid))")
    }
}

extension Input_200 {
    func numIslands(_ grid: [[Character]]) -> Int {
        var result = 0
        if grid.isEmpty || grid[0].isEmpty {
            return result
        }
        
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        
        for currRow in stride(from: 0, to: grid.count, by: 1) {
            for currCol in stride(from: 0, to: grid[0].count, by: 1) {
                if grid[currRow][currCol] == "1" && visited[currRow][currCol] == false {
                    // found the islands, update its neghbours
                    processNeighbours(grid, &visited, currRow, currCol)
                    result += 1
                }
            }
        }
        
        return result
    }
    
    func processNeighbours(_ grid: [[Character]], _ visited: inout [[Bool]], _ currRow: Int, _ currCol: Int) {
        if currRow < 0 || currRow >= grid.count || currCol < 0 || currCol >= grid[0].count || visited[currRow][currCol] == true || grid[currRow][currCol] == "0" {
            return
        }
        
        // Update the visisted matrix flag
        visited[currRow][currCol] = true
        
        // Visit the neighbours
        // Left
        processNeighbours(grid, &visited, currRow, currCol - 1)
        // Right
        processNeighbours(grid, &visited, currRow, currCol + 1)
        // Top
        processNeighbours(grid, &visited, currRow - 1, currCol)
        // bottom
        processNeighbours(grid, &visited, currRow + 1, currCol)
    }
}
