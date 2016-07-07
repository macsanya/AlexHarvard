//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Сашок  on 7/5/16.
//  Copyright (c) 2016 QuadComputing. All rights reserved.
//

import UIKit

class Problem2ViewController: UIViewController, UITextFieldDelegate {
    
    
    var printerString = String()

    
    @IBOutlet weak var output: UILabel!
    
    
    @IBAction func ShowText(sender: AnyObject){
        self.output.text =  printerString
        
        
    }

    
    typealias LifeGrid = [[Bool]]
    typealias Point = (row: Int, col: Int)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Problem 2";
      
        
        
        
    }
    
    
    @IBAction func run(sender: AnyObject) {
        
        let dimensions = 10
        
     
        
        
        var before = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue: false))

        // fill in the before array with 1/3 alive cells
        for row in 0..<dimensions {
            for col in 0..<dimensions {
                if arc4random_uniform(3) == 1 {
                    before[row][col] = true
                } else {
                    before[row][col] = false
                }
            }
        }
        
        var after = Array(count: dimensions, repeatedValue: Array(count: dimensions, repeatedValue: false))
        
        // compute after array
        for row in 0..<dimensions {
            for col in 0..<dimensions {
                let isAlive: Bool = before[row][col]
                let livingNeighborsCount = getLivingNeighborCount(Point(row: row, col: col), grid: before, dimensions: dimensions)
                
                // apply rules based on current state and count of live neighbors
                
                switch isAlive {
                   
                    
                case true:
                    switch livingNeighborsCount {
                    case 0...1:
                        after[row][col] = false
                    case 2, 3:
                        after[row][col] = true
                      
                    case 3...8:
                        after[row][col] = false
                    default:
                        after[row][col] = before[row][col]
                    }
                case false:
                    switch livingNeighborsCount {
                    case 3:
                        after[row][col] = true
                    default:
                        after[row][col] = before[row][col]
                    }
                
                }
            }
        }
        
        printGrid(before, dimensions: dimensions)
        printGrid(after, dimensions: dimensions)
        countGrid(after, dimensions: dimensions)
        
    }
    
    func getLivingNeighborCount(point: Point, grid: LifeGrid, dimensions: Int) -> Int {
        var count = 0
        

        
        for neighborRow in point.row-1...point.row+1 {
            for neighborCol in point.col-1...point.col+1 {
                if neighborRow == point.row && neighborCol == point.col {
                    break
                }
                
                var adjustedNeighborRow = neighborRow
                var adjustedNeighborCol = neighborCol
                
                
                
                if neighborRow < 0 {
                    adjustedNeighborRow = dimensions + neighborRow
                }
                else if  neighborRow >= dimensions {
                    adjustedNeighborRow = 0
                }
                
                
                
                
                if neighborCol < 0 {
                    adjustedNeighborCol = dimensions + neighborCol
                }
                else if neighborCol >= dimensions {
                    adjustedNeighborCol = 0
                }
                
                
                
                
                if grid[adjustedNeighborRow][adjustedNeighborCol] {
                    count += 1
                }
                
            }
        }
        
        return count
    }
    
    func countGrid(grid: LifeGrid, dimensions: Int) {
        var total = 0
        
        for row in 0..<dimensions {
            for col in 0..<dimensions {
                if grid[row][col] == true { total += 1
                    
                }
                
                
            }
       

        }
        
        print (total)
        let myString = String(total)
        output.text? = (myString)
        
        
    
    }
    
    func printGrid(grid: LifeGrid, dimensions: Int) {
        print("-----------------------")
        for row in 0..<dimensions {
            var output = ""
            for col in 0..<dimensions {
                output = output.stringByAppendingString(grid[row][col] ? " 1" : " 0")
               
 
 
            }
          print(output)
        }
        print("-----------------------")
        
    }
  
}

