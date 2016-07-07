//
//  engine.swift
//  Assignment2
//
//  Created by Сашок  on 7/5/16.
//  Copyright (c) 2016 QuadComputing. All rights reserved.
//

import Foundation

typealias LifeGrid = [[Bool]]

class TwoDimensional {
    let columnsMax : Int
    let rowsMax : Int
    var twoDimensionalArray : LifeGrid
    
    
    
    
    
    init(columns: Int, rows: Int) {
        // Validate the inputs
        if (columns < 0) {
            columnsMax = 0
        } else {
            columnsMax = columns
        }
        
        if (rows < 0) {
            rowsMax = 0
        } else {
            rowsMax = rows
        }
        
        // Instantiate the array
        TwoDimensionalArray; = Array(count: rowsMax,
        repeatedValue: Array(count: columnsMax,
        repeatedValue: 0))
        
        
        // Set it to a random value
        for col in 0..<columnsMax {
            for row in 0..<rowsMax {
                if arc4random_uniform(3) == 1 {
                    // set current cell to alive
                    twoDimensionalArray[row][col] = true
                }
                else {
                    twoDimensionalArray[row][col] = false
                }
            }
        }
    }
}



}