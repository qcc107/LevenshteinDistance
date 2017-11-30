//
//  String+LevenshteinDistance.swift
//  LevenshteinDistance
//
//  Created by changcun on 30/11/2017.
//  Copyright © 2017 com.qcc. All rights reserved.
//

// See https://en.wikipedia.org/wiki/Levenshtein_distance
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Array2D

import Foundation

/*
 Two-dimensional array with a fixed number of rows and columns.
 This is mostly handy for games that are played on a grid, such as chess.
 Performance is always O(1).
 */
public struct Array2D<T> {
    public let columns: Int
    public let rows: Int
    fileprivate var array: [T]
    
    public init(columns: Int, rows: Int, initialValue: T) {
        self.columns = columns
        self.rows = rows
        array = .init(repeating: initialValue, count: rows*columns)
    }
    
    public subscript(column: Int, row: Int) -> T {
        get {
            precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            return array[row*columns + column]
        }
        set {
            precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            array[row*columns + column] = newValue
        }
    }
}

extension String
{
    func levenshteinDistance(target: String) -> Int {
        
        let m = self.count
        let n = target.count
        
        guard n != 0 else {
            return m
        }
        
        guard m != 0 else {
            return n
        }
        
        var array = Array2D<Int>(columns: m+1, rows: n+1, initialValue: 0)
        
        let s = Array(self)
        let t = Array(target)
        
        for i in 1...m {
            array[i, 0] = i
        }
        
        for j in 1...n {
            array[0, j] = j
        }
        
        for j in 1...n {
            for i in 1...m {
                
                var substitutionCost = 0
                if s[i-1] != t[j-1]
                {
                    substitutionCost = 1
                }
                
                array[i, j] = min(array[i-1, j] + 1, min(array[i, j-1] + 1, array[i-1, j-1] + substitutionCost))
            }
        }
        
        return array[m, n]
    }
}
