//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Muzammil Muneer on 06/05/2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediate: (n1: Double, method: String)?
    
    mutating func setNumber(_ n: Double) {
        number = n
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "=":
                return performTwoNumCalculation(n2: n)
            case "%":
                return n/100
            default:
                intermediate = (n1: n, method: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediate?.n1, let m = intermediate?.method {
            switch m {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("operation doesnot match any case")
            }
        }
        
        return nil
    }
}
