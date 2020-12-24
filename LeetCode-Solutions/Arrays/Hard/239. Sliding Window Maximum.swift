//
//  239. Sliding Window Maximum.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/3/20.
//

import Foundation

/*
 239. Sliding Window Maximum
 
 You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

 Return the max sliding window.

  

 Example 1:

 Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
 Output: [3,3,5,5,6,7]
 Explanation:
 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
 Example 3:

 Input: nums = [1,-1], k = 1
 Output: [1,-1]
 Example 4:

 Input: nums = [9,11], k = 2
 Output: [11]
 Example 5:

 Input: nums = [4,-2], k = 2
 Output: [4]
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length

 */

class Input_239 {
    func executeInput() {
        let nums = [1,3,1,2,0,5] //[1,3,-1,-3,5,3,6,7]
        let k = 3
        let result = maxSlidingWindow(nums, k)
        print(result)
    }
}

extension Input_239 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var resultArr = [Int]()
        if nums.isEmpty || k == 0 {
            return resultArr
        }
        let resultArrCount = nums.count - k + 1
        
        // Iterate across the first sliding window to get the max
        var max = maxInTheGivenWindow(nums, 0, k-1)
        resultArr.append(max)
        
        // Iterate across the array
        for i in 1..<resultArrCount {
            // if incoming number is greater than current max, update it to be the new max
            if nums[k+i-1] >= max {
                max = nums[k + i - 1]
            } else if nums[i-1] == max {
                // Outgoing num was max, check whats the new max in the sliding window
                max = maxInTheGivenWindow(nums, i, k+i-1)
            }
            resultArr.append(max)
        }
        return resultArr
    }
    
    func maxInTheGivenWindow(_ nums: [Int], _ startIdx: Int, _ endIdx: Int) -> Int {
        var currMax = Int.min
        for j in nums[startIdx...endIdx] {
            // Update the max for the sliding window
            if j > currMax {
                currMax = j
            }
        }
        return currMax
    }
}
