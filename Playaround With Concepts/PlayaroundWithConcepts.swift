//
//  PlayaroundWithConcepts.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 12/18/20.
//

import Foundation

struct PlayaroundWithConcepts {
    
    func testYourConcepts() {
        // Test Swift Dictionary "contains" API
        // input_dictionaryContainsAPITest()
        
        // Array Reverse Iteration
        // input_arrayReverseIteration()
        
        // input_findMaxSumSubArray()
        
        // input_findMinSubArray()
        
        input_charArrayMap()
    }
}

extension PlayaroundWithConcepts {
    
    func input_dictionaryContainsAPITest() {
        var input = [1: [1,2,3],
                     4: [11,12,13],
                    -1: [9,8,7]
                    ]

        let newKey0 = 0
        let newVal0 = 17
        dictionaryContainsAPITest(input: &input,newKey: newKey0, newVal: newVal0)
        print("Result0: \(input)")

        let newKey1 = -1
        let newVal1 = 6
        dictionaryContainsAPITest(input: &input,newKey: newKey1, newVal: newVal1)
        print("Result1: \(input)")

        print("All Keys: \(input.keys)")

    }
    
    func dictionaryContainsAPITest(input: inout [Int: [Int]], newKey: Int, newVal: Int) {
        if input.contains(where: { (key, val) in
            return key == newKey
        }) {
            input[newKey] = input[newKey]! + [newVal]
        } else {
            input[newKey] = [newVal]
        }
    }
}

extension PlayaroundWithConcepts {
    func input_arrayReverseIteration() {
        arrayReverseIteraction(input: [1,-1,0,4,7])
    }
    
    // Array test for reverse iteration
    func arrayReverseIteraction(input: [Int]) {
        print("Input Array: \(input)")
        for index in stride(from: input.count - 1, through: 0, by: -1) {
            print("\(input[index])")
        }
    }
}

extension PlayaroundWithConcepts {
    func input_charArrayMap() {
        let name: [Character] = ["d", "i", "l", "g", "i", "r"]
        let string = name.reduce("") { (x, y) in
            x + String(y)
        }
        print(string)
    }
}

extension PlayaroundWithConcepts {
    func input_findMaxSumSubArray() {
        let nums = [2, 3, 4, 1, 5]
        let k = 2
        print(findMaxSumSubArray(nums, k))
    }
    
    // Given an array of positive numbers and a positive number ‘k,’ find the maximum sum of any contiguous subarray of size ‘k’
    func findMaxSumSubArray(_ nums: [Int], _ k: Int) -> Int {
        var maxSumSoFar = Int.min
        var currSum = 0
        for i in stride(from: 0, through: nums.count - 1, by: 1) {
            if i < k {
                currSum += nums[i]
            } else {
                currSum += nums[i] - nums[i-k]
            }
            if currSum > maxSumSoFar {
                maxSumSoFar = currSum
            }
        }
        return maxSumSoFar
    }
}

extension PlayaroundWithConcepts {
    // Given an array of positive numbers and a positive number ‘S,’ find the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’. Return 0 if no such subarray exists.
    func input_findMinSubArray() {
        let nums = [3, 4, 1, 1, 6]
        let k = 8
        print(findMinSubArray(nums, k))
    }
    
    // Scan through the array using Kadane's algorithm
    // if sum of contigous subarray has reached the target, pick the subarray, check if it is the new answer, start new subarray from current node
    // if sum of contigous subarray has cross the target, pick the current index as the first index of the next subarray
    func findMinSubArray(_ nums: [Int], _ k: Int) -> Int {
        var subArraySoFar = [Int]()
        var minLength = Int.max
        
        for i in stride(from: 0, to: nums.count, by: 1) {
            subArraySoFar.append(nums[i])
            if subArraySoFar.reduce(0, +) >= k {
                if nums[i] >= k {
                    minLength = 1
                } else if subArraySoFar.count < minLength {
                    minLength = subArraySoFar.count
                }
                while subArraySoFar.reduce(0, +) >= k {
                    subArraySoFar.removeFirst()
                }
            }
        }
        return minLength
    }
}
