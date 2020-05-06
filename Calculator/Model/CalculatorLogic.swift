//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Muzammil Muneer on 06/05/2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    var number: Double
    
    init(n: Double) {
        self.number = n
    }
    
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-"{
            return number * -1
        }
        else if symbol == "AC"{
            return 0
        }
        else if symbol == "%"{
            return number/100
        }
        
        return nil
    }
    
}
