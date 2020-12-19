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
        input_dictionaryContainsAPITest()
        
        // Array Reverse Iteration
        input_arrayReverseIteration()
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
