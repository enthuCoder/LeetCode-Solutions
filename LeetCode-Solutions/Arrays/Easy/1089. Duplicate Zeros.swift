//
//  1089. Duplicate Zeros.swift
//  LeetCode-Solutions
//
//  Created by Dilgir Siddiqui on 11/23/20.
//

import Foundation

/*
 1089. Duplicate Zeros
 
 Given a fixed length array arr of integers, duplicate each occurrence of zero, shifting the remaining elements to the right.

 Note that elements beyond the length of the original array are not written.

 Do the above modifications to the input array in place, do not return anything from your function.
 
 Example 1:

 Input: [1,0,2,3,0,4,5,0]
 Output: null
 Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
 Example 2:

 Input: [1,2,3]
 Output: null
 Explanation: After calling your function, the input array is modified to: [1,2,3]
 
*/

class Input_1089 {
    
    // Input Parameters
    var input1 = [1,0,2,3,0,4,5,0]
    var input2 = [1,2,3]
    var input3 = [8,4,5,0,0,0,0,7]
    
    func executeInput() {
        print("1089. Duplicate Zeros")
        print("- - - - - - - - - - - - - - ")
        let input = [input1, input2, input3]
        
        // Test for various inputs
        for currentInput in input {
            var testInput = currentInput
            print("INPUT: \(testInput)")
            duplicateZeros(&testInput)
            print("OUTPUT: \(testInput)\n")
        }
        print("- - - - - - - - - - - - - -\n")
    }
}

extension Input_1089 {
    
    func duplicateZeros(_ arr: inout [Int]) {
        
        // Using additional space (temporary array)
        //duplicateZeros_additionalSpace(&arr)
        
        // Using in-place replacement
        duplicateZeros_InPlace(&arr)
        
    }
    
    func duplicateZeros_additionalSpace(_ arr: inout [Int]) {
        if arr.count <= 1 {
            return
        } else {
            // Temporary array for iterating over the input array
            let tempArray = arr
            
            // Index to track the index in input array, where the value might be replaced
            var currentIndex = 0

            for(index, value) in tempArray.enumerated() {
                // Break out of the loop if current index has reached the end index of input array
                if currentIndex >= arr.count {
                    break
                }
                
                // Check if replacement needs to be done
                if value == 0  {
                    if currentIndex + 1 < arr.count {
                        arr[currentIndex] = 0
                        arr[currentIndex + 1] = 0
                        currentIndex += 2
                    } else if currentIndex == arr.count - 1 {
                        arr[currentIndex] = 0
                        break
                    }
                }
                // No replacement done, adjust the currentIndex position
                else {
                    if index != currentIndex {
                        arr[currentIndex] = value
                    }
                    currentIndex += 1
                }
            }
        }
    }
    
    
    func duplicateZeros_InPlace(_ arr: inout [Int]) {
        if arr.count <= 1 {
            return
        } else {
            // Calculate the index after which elements in the original array will not be included
            var dupZeros = 0
            var last = arr.count - 1
            
            var index = 0 // Just for running the while loop
            while (index <= last - dupZeros) { // GIST OF THIS ALGO is this line of code
                if arr[index] == 0 {
                    if index == last - dupZeros {
                        arr[last] = 0
                        last -= 1
                        break
                    }
                    dupZeros += 1
                }
                index += 1
            }

            // Last index in the original array, beyond which, elements will not be included
            var lastIndex = last - dupZeros
            
            // Iterate through the array in reverse order, to put the elements in correct places
            while lastIndex >= 0 {
                if arr[lastIndex] == 0 {
                    arr[lastIndex + dupZeros] = 0
                    dupZeros -= 1
                    arr[lastIndex + dupZeros] = 0
                } else {
                    arr[lastIndex + dupZeros] = arr[lastIndex]
                }
                
                lastIndex -= 1
            }
        }
    }
}
